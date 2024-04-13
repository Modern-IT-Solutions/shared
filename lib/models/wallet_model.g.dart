// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      id: json['id'] as String?,
      balance: (json['balance'] as num).toDouble(),
      icoming: (json['icoming'] as num?)?.toDouble(),
      outgoing: (json['outgoing'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'icoming': instance.icoming,
      'outgoing': instance.outgoing,
    };
