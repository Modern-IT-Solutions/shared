// import 'package:flutter_test/flutter_test.dart';

// import 'package:shared/shared.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared/helpers.dart';
import 'package:shared/shared.dart';

void main() async {
  Services.instance.register(SecurityService());
  await Services.instance.init();
  // test encryption
  var security = getSecurity();
  // test('encrypt and decrypt', () async {
  var text = 'Hello World';
  var encrypted = await security.encryptVideo(text);
  var decrypted = await security.decryptVideoHash(encrypted);
  print(encrypted);
  print(decrypted);
  // });
}
