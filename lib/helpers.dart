import 'package:core/core.dart';
import 'package:lib/utils/platforms.dart';
import 'package:shared/models/bill_item_template_model.dart';
import 'package:shared/models/displacement_cost_list_model.dart';
import 'package:algeria/algeria.dart';
import 'package:shared/models/home_ad.dart';
import 'package:shared/models/home_section.dart';
export 'package:lib/utils/platforms.dart';

import 'models/event_preference.dart';
import 'models/slider_item_model.dart';
import 'services/security.dart';
import 'package:core/services/defaults/settings/settings.dart';
import 'dart:math';

SecurityService getSecurity() {
  return Services.instance.get<SecurityService>()!;
}

SettingsService getSettings() {
  return Services.instance.get<SettingsService>()!;
}

NotificationService getNotificationService() {
  return Services.instance.get<NotificationService>()!;
}

extension ProfileModelxPreferences on ProfileModel {
  Map<String, dynamic>? get preferences {
    return customClaims['preferences'] as Map<String, dynamic>?;
  }
}

enum Feature {
  videoItem,
  liveYoutubeItem,
  wallet,
  events,
}

extension PreferencesEx on PreferencesService {
  bool get allowScreenRecording {
    if (Platforms.isIOS && iosAllowScreenRecording != null) {
      return iosAllowScreenRecording!;
    }
    if (Platforms.isAndroid && androidAllowScreenRecording != null) {
      return androidAllowScreenRecording!;
    }
    return getOption<bool>('allowScreenRecording', defaults: false)!;
  }

  bool? get iosAllowScreenRecording {
    return getOption<bool>('iosAllowScreenRecording');
  }

  bool? get androidAllowScreenRecording {
    return getOption<bool>('androidAllowScreenRecording');
  }

  bool isFeatureEnabled(Feature feature) {
    if (Platforms.isIOS && iosFeatures != null) {
      return iosFeatures!.contains(feature);
    }
    if (Platforms.isAndroid && androidFeatures != null) {
      return androidFeatures!.contains(feature);
    }
    return getOption<List<Feature>>('features', defaults: Feature.values)!.contains(feature);
  }

  List<Feature> get androidFeatures {
    return getOption<List<Feature>>('androidFeatures', defaults: [])!;
  }

  List<Feature>? get iosFeatures {
    return getOption<List<Feature>>('iosFeatures');
  }

  /// allowExternalStorage
  bool get allowExternalStorage {
    if (Platforms.isIOS && iosAllowExternalStorage != null) {
      return iosAllowExternalStorage!;
    }
    if (Platforms.isAndroid && androidAllowExternalStorage != null) {
      return androidAllowExternalStorage!;
    }
    return getOption<bool>('allowExternalStorage', defaults: false)!;
  }

  bool? get iosAllowExternalStorage {
    return getOption<bool>('iosAllowExternalStorage');
  }

  bool? get androidAllowExternalStorage {
    return getOption<bool>('androidAllowExternalStorage');
  }

  /// allowRootedDevice
  bool get allowRootedDevice {
    if (Platforms.isIOS && iosAllowRootedDevice != null) {
      return iosAllowRootedDevice!;
    }
    if (Platforms.isAndroid && androidAllowRootedDevice != null) {
      return androidAllowRootedDevice!;
    }
    return getOption<bool>('allowRootedDevice', defaults: false)!;
  }

  bool? get iosAllowRootedDevice {
    return getOption<bool>('iosAllowRootedDevice');
  }

  bool? get androidAllowRootedDevice {
    return getOption<bool>('androidAllowRootedDevice');
  }

  bool get allowRunningInEmulator {
    if (Platforms.isIOS && iosAllowRunningInEmulator != null) {
      return iosAllowRunningInEmulator!;
    }
    if (Platforms.isAndroid && androidAllowRunningInEmulator != null) {
      return androidAllowRunningInEmulator!;
    }
    return getOption<bool>('allowRunningInEmulator', defaults: false)!;
  }

  bool? get iosAllowRunningInEmulator {
    return getOption<bool>('iosAllowRunningInEmulator');
  }

  bool? get androidAllowRunningInEmulator {
    return getOption<bool>('androidAllowRunningInEmulator');
  }

  /// allowDeveloperMode
  bool get allowDeveloperMode {
    if (Platforms.isIOS && iosAllowDeveloperMode != null) {
      return iosAllowDeveloperMode!;
    }
    if (Platforms.isAndroid && androidAllowDeveloperMode != null) {
      return androidAllowDeveloperMode!;
    }
    return getOption<bool>('allowDeveloperMode', defaults: false)!;
  }

  bool? get iosAllowDeveloperMode {
    return getOption<bool>('iosAllowDeveloperMode');
  }

  bool? get androidAllowDeveloperMode {
    return getOption<bool>('androidAllowDeveloperMode');
  }

  /// bypassSecurity
  bool get bypassSecurity {
    if (Platforms.isIOS && iosByPassSecurity != null) {
      return iosByPassSecurity!;
    }
    if (Platforms.isAndroid && androidByPassSecurity != null) {
      return androidByPassSecurity!;
    }
    var v = getOption<bool>('bypassSecurity', defaults: false)!;
    return v;
  }

  bool? get iosByPassSecurity {
    return getOption<bool>('iosByPassSecurity');
  }

  bool? get androidByPassSecurity {
    return getOption<bool>('androidByPassSecurity');
  }

  int get minimumAppBuildNumber {
    return getOption<int>('minimumAppBuildNumber', defaults: 0)!;
  }

  int get androidMinimumAppBuildNumber {
    return getOption<int>('androidMinimumAppBuildNumber', defaults: minimumAppBuildNumber)!;
  }

  int get iosMinimumAppBuildNumber {
    return getOption<int>('iosMinimumAppBuildNumber', defaults: minimumAppBuildNumber)!;
  }

  bool get forceUpgrade {
    if (Platforms.isIOS && iosForceUpgrade != null) {
      return iosForceUpgrade!;
    }
    if (Platforms.isAndroid && androidForceUpgrade != null) {
      return androidForceUpgrade!;
    }
    return getOption<bool>('forceUpgrade', defaults: false)!;
  }

  bool? get androidForceUpgrade {
    return getOption<bool>('androidForceUpgrade');
  }

  bool? get iosForceUpgrade {
    return getOption<bool>('iosForceUpgrade');
  }

  // showUpdateDialog
  bool get showUpdateDialog {
    if (Platforms.isIOS && iosShowUpdateDialog != null) {
      return iosShowUpdateDialog!;
    }
    if (Platforms.isAndroid && androidShowUpdateDialog != null) {
      return androidShowUpdateDialog!;
    }
    return getOption<bool>('showUpdateDialog', defaults: true)!;
  }

  bool? get androidShowUpdateDialog {
    return getOption<bool>('androidShowUpdateDialog');
  }

  bool? get iosShowUpdateDialog {
    return getOption<bool>('iosShowUpdateDialog');
  }

  String get updateDialogMessage {
    return getOption<String>('updateDialogMessage', defaults: "يوجد تحديث جديد للتطبيق")!;
  }

  String get androidUpdateDialogMessage {
    return getOption<String>('androidUpdateDialogMessage', defaults: updateDialogMessage)!;
  }

  String get iosUpdateDialogMessage {
    return getOption<String>('iosUpdateDialogMessage', defaults: updateDialogMessage)!;
  }

  bool get showWallet {
    if (Platforms.isIOS && iosShowWallet != null) {
      return iosShowWallet!;
    }
    if (Platforms.isAndroid && androidShowWallet != null) {
      return androidShowWallet!;
    }
    return getOption<bool>('showWallet', defaults: true)!;
  }

  bool get forceCacheUnits {
    return getOption<bool>('forceCacheUnits', defaults: false)!;
  }

  // max sessions per user
  int get maxSessionsPerUser {
    return getOption<int>('maxSessionsPerUser', defaults: 5)!;
  }

  bool? get iosShowWallet {
    return getOption<bool>('iosShowWallet', defaults: false);
  }

  bool? get enableIOSInARM {
    return getOption<bool>('enableIOSInARM', defaults: false);
  }

  bool? get androidShowWallet {
    return getOption<bool>('androidShowWallet');
  }

  bool get useInAppPurchase {
    if (Platforms.isIOS && iosUseInAppPurchase != null) {
      return iosUseInAppPurchase!;
    }
    if (Platforms.isAndroid && androidUseInAppPurchase != null) {
      return androidUseInAppPurchase!;
    }
    return getOption<bool>('useInAppPurchase', defaults: false)!;
  }

  bool? get iosUseInAppPurchase {
    return getOption<bool>('iosUseInAppPurchase');
  }

  bool? get androidUseInAppPurchase {
    return getOption<bool>('androidUseInAppPurchase');
  }

  String? get googlePlayListingURL {
    return getOption<String>('androidAppStoreListingURL', defaults: "https://play.google.com/store/apps/details?id=com.zedacademy.zed_academy");
  }

  String? get appStoreListingURL {
    return getOption<String>('iosAppStoreListingURL', defaults: "https://apps.apple.com/us/app/zed-academy-app/id1673777567");
  }

  // useCache
  bool get useCache {
    if (Platforms.isIOS && iosUseCache != null) {
      return iosUseCache!;
    }
    if (Platforms.isAndroid && androidUseCache != null) {
      return androidUseCache!;
    }
    return getOption<bool>('useCache', defaults: true)!;
  }

  bool? get iosUseCache {
    return getOption<bool>('iosUseCache');
  }

  bool? get androidUseCache {
    return getOption<bool>('androidUseCache');
  }

  // showClearCacheButton
  bool get showClearCacheButton {
    if (Platforms.isIOS && iosShowClearCacheButton != null) {
      return iosShowClearCacheButton!;
    }
    if (Platforms.isAndroid && androidShowClearCacheButton != null) {
      return androidShowClearCacheButton!;
    }
    return getOption<bool>('showClearCacheButton', defaults: true)!;
  }

  bool? get iosShowClearCacheButton {
    return getOption<bool>('iosShowClearCacheButton');
  }

  bool? get androidShowClearCacheButton {
    return getOption<bool>('androidShowClearCacheButton');
  }

  // minmumUpdateDuration
  Duration get minmumUpdateDuration {
    if (Platforms.isIOS && iosMinmumUpdateDuration != null) {
      return iosMinmumUpdateDuration!;
    }
    if (Platforms.isAndroid && androidMinmumUpdateDuration != null) {
      return androidMinmumUpdateDuration!;
    }
    return getOption<Duration>('minmumUpdateDuration', defaults: const Duration(seconds: 5))!;
  }

  Duration? get iosMinmumUpdateDuration {
    return getOption<Duration>('iosMinmumUpdateDuration');
  }

  Duration? get androidMinmumUpdateDuration {
    return getOption<Duration>('androidMinmumUpdateDuration');
  }

  // showHomeHelpPanel
  bool get showHomeHelpPanel {
    if (Platforms.isIOS && iosShowHomeHelpPanel != null) {
      return iosShowHomeHelpPanel!;
    }
    if (Platforms.isAndroid && androidShowHomeHelpPanel != null) {
      return androidShowHomeHelpPanel!;
    }
    return getOption<bool>('showHomeHelpPanel', defaults: true)!;
  }

  bool? get iosShowHomeHelpPanel {
    return getOption<bool>('iosShowHomeHelpPanel');
  }

  bool? get androidShowHomeHelpPanel {
    return getOption<bool>('androidShowHomeHelpPanel');
  }

  // showUnderConstruction
  bool get showUnderConstruction {
    if (Platforms.isIOS && iosShowUnderConstruction != null) {
      return iosShowUnderConstruction!;
    }
    if (Platforms.isAndroid && androidShowUnderConstruction != null) {
      return androidShowUnderConstruction!;
    }
    return getOption<bool>('showUnderConstruction', defaults: false)!;
  }

  bool? get iosShowUnderConstruction {
    return getOption<bool>('iosShowUnderConstruction');
  }

  bool? get androidShowUnderConstruction {
    return getOption<bool>('androidShowUnderConstruction');
  }

  List<Map<String, dynamic>> get ccps {
    return preferences['ccps']?['value'] ??
        [
          {
            "title": "للشحن في دورات الرياضيات",
            "accountKey": 50,
            "number": "0020609836",
            "address": "BARIKA",
            "lastName": "BRIKAT",
            "firstName": "ABDELBASSET",
            "rip": "007 99999 0020609836 50"
          },
          {
            "title": "للشحن في دورات الفيزياء",
            "accountKey": 70,
            "number": "0020711744",
            "address": "تلمسان",
            "lastName": "زدون",
            "firstName": "محمد",
            "rip": "007 99999 0020711744 70",
          }
        ];
  }

  List<SliderItem> get sliders {
    final sliders = preferences['slides']?.values.map((e) {
          return SliderItem.fromJson(e);
        }).toList() ??
        [];

    return sliders;
  }

  List<HomeSection> get homeSections {
    final sections = preferences['homeSections']?.values.map((e) {
          return HomeSection.fromJson(e);
        }).toList() ??
        [];

    return sections;
  }

  List<HomeAd> get homeAds {
    final ads = preferences['homeAds']?.values.map((e) {
          return HomeAd.fromJson(e);
        }).toList() ??
        [];

    return ads;
  }

  List<EventPreference> get events {
    final events = preferences['events']?.values.map((e) {
          return EventPreference.fromJson(e);
        }).toList() ??
        [];

    return events;
  }
}

/// [getBillItemsList]
/// list of [BillItemTemplateModel] for auto complete in client app
Future<List<BillItemTemplateModel>> getBillItemsList() async {
  var settings = await getDocument(path: 'preferences/settings');
  return [
    for (var item in settings?.data['billItems'] ?? []) BillItemTemplateModel.fromJson(item),
  ];
}

/// [getDisplacementCostList]
Future<List<DisplacementCostModel>> getDisplacementCostList() async {
  var settings = await getDocument(path: 'preferences/settings');
  return [
    for (var item in settings?.data['displacementCosts'] ?? []) DisplacementCostModel.fromJson(item),
  ];
}
