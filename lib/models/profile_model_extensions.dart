import 'dart:async';
import 'dart:ui';

import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/shared.dart';

import 'transaction_model.dart';
import 'unit_model.dart';
import 'wallet_model.dart';

/// wallet extension to the [StudentModel]
extension StudentWalletEx on ProfileModel {
  /// walletm is read only property fron customClaims
  WalletModel get wallet => WalletModel.fromJson({
        'uid': uid,
        ...customClaims['wallet'] ??
            {
              'id': uid,
              'balance': 0.0,
              'currency': 'DZD',
            },
      });

  List<String> get products => List<String>.from([
        ...(customClaims['products'] ?? []),
        ...inAppPurchaseProducts,
      ]);
  List<String> get inAppPurchaseProducts => List<String>.from(metadata['inAppPurchaseProducts'] ?? []);

  List<String> completed(String? unit) {
    var list = List<String>.from(metadata['completed'] ?? []);
    if (unit != null && unit.isNotEmpty){
      return list.where((e) => e.contains(unit)).toList();
    }
    return list;
  } 
}
