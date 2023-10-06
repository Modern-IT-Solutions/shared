import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {

  factory WalletModel({
    required String id,
    required double balance,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}