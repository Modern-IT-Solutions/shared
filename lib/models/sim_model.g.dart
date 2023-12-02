// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimModelImpl _$$SimModelImplFromJson(Map<String, dynamic> json) =>
    _$SimModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      operator: $enumDecode(_$NetworkOperatorEnumMap, json['operator']),
      pinCode: json['pinCode'] as String?,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      bonusBalance: (json['bonusBalance'] as num?)?.toDouble() ?? 0,
      status: $enumDecode(_$SimStatusEnumMap, json['status']),
      lastBalanceFetchAt: (json['lastBalanceFetchAt'] as num).toDouble(),
      lastBonusBalanceFetchAt:
          (json['lastBonusBalanceFetchAt'] as num).toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$SimModelImplToJson(_$SimModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'operator': _$NetworkOperatorEnumMap[instance.operator]!,
      'pinCode': instance.pinCode,
      'balance': instance.balance,
      'bonusBalance': instance.bonusBalance,
      'status': _$SimStatusEnumMap[instance.status]!,
      'lastBalanceFetchAt': instance.lastBalanceFetchAt,
      'lastBonusBalanceFetchAt': instance.lastBonusBalanceFetchAt,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$NetworkOperatorEnumMap = {
  NetworkOperator.ooredoo: 'ooredoo',
  NetworkOperator.djezzy: 'djezzy',
  NetworkOperator.mobilis: 'mobilis',
};

const _$SimStatusEnumMap = {
  SimStatus.enabled: 'enabled',
  SimStatus.disabled: 'disabled',
};
