import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import 'package:core/services/consts/consts.dart';
// ignore: depend_on_referenced_packages
import 'package:fast_rsa/fast_rsa.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_device/safe_device.dart';
import 'package:screen_capture_event/screen_capture_event.dart';
import 'package:shared/shared.dart';
// ignore: depend_on_referenced_packages
import 'package:universal_html/html.dart' as html;
// ignore: depend_on_referenced_packages
import 'package:universal_io/io.dart';
import 'package:zplayer/zplayer.dart';

/// [SecurityService] responsible for security of the app content and users
class SecurityService extends Service {
  SecurityService({
    super.id = 'DEFAULT',
  });
  @override
  Future<void> init() async {
    if (!kIsWeb) {
      await _initScreenRecordingDetection();
    }
    if (kIsWeb) {
      await _initElectronWeb();
    } else {
      await _initDeviceSafety();
    }
    super.init();
    log.info('App~Service: Security initialized');
  }

  @override
  void dispose() {
    super.dispose();
    screenListener?.dispose();
    _htmlOnLoadSubscription?.cancel();

    log.info('App~Service: Security disposed');
  }

  bool? _isRecording;
  bool? get isRecording => _isRecording;
  late ScreenCaptureEvent? screenListener = kIsWeb || !(Platform.isAndroid || Platform.isIOS) ? null : ScreenCaptureEvent();

  /// detect screen recording
  Future<void> _initScreenRecordingDetection() async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      log.warning('App~Service: Only Android and iOS are supporte Screen Security');
      return;
    }
    if (screenListener == null) {
      log.warning('App~Service: Screen recording not supported on web');
      return;
    }

    _isRecording = await screenListener!.isRecording();
    notifyListeners();
    screenListener!.addScreenRecordListener((event) {
      _isRecording = event;
      notifyListeners();
    });
    screenListener!.watch();
    log.info('App~Service: Screen recording detection initialized');
  }

  bool? get isSafe {
    var prefs = getPrefs();
    if (kIsWeb) {
      return true;
    }
    if (isRecording == true) {
      return false;
    }
    if (Platform.isAndroid) {
      if (isJailbroken == true) {
        return false;
      }
      if (isDeveloperMode == false && !kDebugMode) {
        return false;
      }
      return isRealDevice == true && isOnExternalStorage == false;
    } else {
      if (isJailbroken == true) {
        return false;
      }
      return isRealDevice == true;
    }
  }

  bool? _isJailbroken;
  bool? get isJailbroken => _isJailbroken;
  bool? _isDeveloperMode;
  bool? get isDeveloperMode => _isDeveloperMode;
  bool? _isRealDevice;
  bool? get isRealDevice => _isRealDevice;
  bool? _canMockLocation;
  bool? get canMockLocation => _canMockLocation;
  bool? _isOnExternalStorage;
  bool? get isOnExternalStorage => _isOnExternalStorage;

  final deviceInfo = DeviceInfoPlugin();

  /// check if the app is safe
  Future<void> _initDeviceSafety() async {
    if (Platform.isIOS || Platform.isAndroid) {
      _isJailbroken = await SafeDevice.isJailBroken;
    } else {
      log.warning('App~Service: Only Android and iOS are supported for Jailbreak detection');
    }
    if (Platform.isAndroid) {
      _isDeveloperMode = await SafeDevice.isDevelopmentModeEnable;
    } else {
      log.warning('App~Service: Only Android and iOS are supported for Developer mode detection');
    }
    if (!Platform.isAndroid && !Platform.isIOS) {
      log.warning('App~Service: Only Android and iOS are supported for Real device detection');
    } else {
      _isRealDevice = await SafeDevice.isRealDevice;
      if (!kIsWeb) {
        if (Platform.isIOS && !(await deviceInfo.iosInfo).isPhysicalDevice) _isRealDevice = false;
        if (Platform.isAndroid && !(await deviceInfo.androidInfo).isPhysicalDevice) _isRealDevice = false;
      }
    }
    if (!Platform.isAndroid && !Platform.isIOS) {
      log.warning('App~Service: Only Android and iOS are supported for Mock location detection');
    } else {
      _canMockLocation = await SafeDevice.canMockLocation;
    }
    if (!Platform.isAndroid) {
      log.warning('App~Service: Only Android is supported for External storage detection');
    } else {
      _isOnExternalStorage = await SafeDevice.isOnExternalStorage;
    }
    notifyListeners();
    log.info('App~Service: Device safety initialized');
  }

  /// check if the app is running on electron web
  /// in this case allow the app to run on web
  Future<void> _initElectronWeb() async {
    if (kIsWeb) {
      onReady() {
        html.window.addEventListener('message', (dynamic e) {
          if (e.data == 'forceRecordingValueToTrue') {
            _isRecording = true;
            notifyListeners();
          } else if (e.data == 'forceRecordingValueToFalse') {
            _isRecording = false;
            notifyListeners();
          }
        });
        html.window.parent?.postMessage('ready', '*');
        log.info('Not Electron web');
      }

      _htmlOnLoadSubscription = html.window.onLoad.listen((event) {
        onReady();
      });
    }
    log.info('App~Service: Electron web initialized');
  }

  /// html window subscription
  StreamSubscription<html.Event>? _htmlOnLoadSubscription;

  Future<String> decryptVideoHash(String hash) async {
    Uint8List result = await RSA.decryptOAEPBytes(
      Uint8List.fromList(hex.decode(hash)),
      '',
      Hash.SHA256,
      _Secrets.privateKey,
    );
    return String.fromCharCodes(result);
  }

  Future<String> encryptVideo(String data) async {
    Uint8List result = await RSA.encryptOAEPBytes(
      Uint8List.fromList(data.codeUnits),
      '',
      Hash.SHA256,
      _Secrets.publicKey,
    );
    return hex.encode(result);
  }
}

/// [ZPlayerService] responsible for playing audio and video
class ZPlayerService extends Service {
  ZPlayerService({
    super.id = 'DEFAULT',
  });

  @override
  Future<void> init() async {
    ZPlayer.ensureInitialized();
    super.init();
    log.info('App~Service: Player initialized');
  }

  @override
  void dispose() {
    super.dispose();
    log.info('App~Service: Player disposed');
  }
}

class _Secrets {
  // the private should be stored in a secure place
  // but here we split it to two parts to make it harder to find
  // also we reverse the order of the parts
  static get privateKey {
    var header = ";;;;;YEK ETAVIRP ASR NIGEB;;;;;".replaceAll(';', '-').split("").reversed.join();
    var footer = ";;;;;YEK ETAVIRP ASR DNE;;;;;".replaceAll(';', '-').split("").reversed.join();
    return '$header\nMIIEowIBAAKCAQEApbj+6J9NTrG8cVRSfbHNpxL1gWEU02t1s8G06ZEUfzvZc+ws\nmpobrC9EI6jobwAf1scJMSelTxHFOSZ5gz5VsLI4ogh28TxpoTJGqIwNFQwDsvyb\n2w4EzK6pOeK1VFQJIDETzPg2OD4hjEsKvm5EMgONJRK4hnFj/4jpp7/32xpR+F/B\nKI38op8BYzpeP9Ji+Vm/LhwaCqPndfffDsxgQoY+XeCEVpUD5bROJVq15U20vvK6\nbeEc9fZg5tbk9rWqK+bMmRhvs6kcOwO9wZ1dcLwewN7HQQHXIcqp+dXcLBLVNKDj\nr3FUK64nT7DJS9AoAoZT+j8iOnP8yrawSXKLQQIDAQABAoIBAD3F+JbjkqCL1g90\nfA9IcL0fbw4cDvRD8SrhQLtzje1jdMomNfYnDbugHskgFAwUQsn/hSiie5c+q4KD\nGfZXDQABXuTfPN7tQv6ITBhVpCa9RL+6M6pyzk0xqfjezfKyJHiwco4L08IhPsYZ\nztZvKdJuynUQRmIu8DR3Z4lVIGG2E1ieaOhFroobaIbIZxhdFnNPmDSwEbeAqlAX\nwTkVlHp8SgB+PS9yDZtUwdJCynze4qw3+r7/72uLcVdMzV8hnPyG2JHpgqoq7BRR\nz65k3RIHhrpQSbHOQOFGZnfMn5we1J94+WumdAdxRG2Awm/R55ZxjXo7CTgJwSKe\nc5/EcvECgYEA0I5xefSPz53djjdYZPNtblWkZ2Wdga4/hzp3OXt3fLfd8bCOYAp+\nZXaTL3LEtGabmrTjXJKxDY2H+BogWZkzBWLA8S302l37cK7VR6YMfvUcCp4dv4mT\nFwJH86Q1EKXd15oVdgIYH0NMCbVe5Qyinhey+0g4P4LxoLxthsHxu50CgYEAy2wS\nNNCvNJjseLEo6OlB/5twj8Abr9QittjGn+MM0QNx4Ao3v2fFtRDCT8hduVETQAPu\n6ZaKdgxRuoUzU0/bG+84mohtjQ8y2XyMJY+ujV0Ho1vTC0dN2+4DgZGhw+s+h4+m\nfLq7Xr4N15JdNb0Va+aZ1i1qdKbGI2Er2VQclvUCgYAkXFFIc+0Gw303KEsO/qnb\njK7nH/4/98M3rmfO68m/Qsc9Ngz8jZfP1MaAhT/qO+FxLYxePW0E8eH8zYFKXb1Z\neQguhFamI7CMys6AeWDAWbeT2lFRbYjpgApPXheqWWC+EC0hr+fIu5DsOGTdBkDr\n0zHvQX4dBJVf8rodvn6IuQKBgFhjMNX6BubXu4gFkj0BfUfPBm2vj1gq2JqSPlui\nkCMRWB180xQ7xtAR5Bw+d1raO38JNnoQi0EXwTtGPTLp886DdxjORquP+ww87bg0\nYifSUEtOzriL1uzE0okt+hfi01ybsj9n85oLAoC0fAOpkPE9VYKWYTcmb9lXk3Hu\n9i0xAoGBALDHDtu4aej3M1LKc1lycKsG5SaJB8qFWUcZ4/Wh7U6gdpcoM01D8Z+b\nEzpWlu6f6L/UWqepTlCni5PRtAm0z9iqZqBc/Bw428bW1uTr6yrZgIqdRUQZ3y0A\nV7PP1Nc4FOsNQyPWAOGZdCVPQZ7KzqvL6PY7pGA7eRZZwJhRQFVB\n$footer\n';
  }

  static get publicKey {
    var header = ";;;;;YEK CILBUP ASR NIGEB;;;;;".replaceAll(';', '-').split("").reversed.join();
    var footer = ";;;;;YEK CILBUP ASR DNE;;;;;".replaceAll(';', '-').split("").reversed.join();
    return '$header\nMIIBCgKCAQEApbj+6J9NTrG8cVRSfbHNpxL1gWEU02t1s8G06ZEUfzvZc+wsmpob\nrC9EI6jobwAf1scJMSelTxHFOSZ5gz5VsLI4ogh28TxpoTJGqIwNFQwDsvyb2w4E\nzK6pOeK1VFQJIDETzPg2OD4hjEsKvm5EMgONJRK4hnFj/4jpp7/32xpR+F/BKI38\nop8BYzpeP9Ji+Vm/LhwaCqPndfffDsxgQoY+XeCEVpUD5bROJVq15U20vvK6beEc\n9fZg5tbk9rWqK+bMmRhvs6kcOwO9wZ1dcLwewN7HQQHXIcqp+dXcLBLVNKDjr3FU\nK64nT7DJS9AoAoZT+j8iOnP8yrawSXKLQQIDAQAB\n$footer\n';
  }

  // static const privateKey = ;
  // static const publicKey =
}

/// bypassSecurity extension to ProfileModel
extension BypassSecurityExtension on ProfileModel {
  bool get bypassSecurity {
    return customClaims['bypassSecurity'] == true;
  }
}
