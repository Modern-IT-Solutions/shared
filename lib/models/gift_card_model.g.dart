// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftCardModelImpl _$$GiftCardModelImplFromJson(Map<String, dynamic> json) =>
    _$GiftCardModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      owner: json['owner'] == null
          ? null
          : ProfileModel.fromJson(json['owner'] as Map<String, dynamic>),
      code: json['code'] as String,
      expiresAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['expiresAt']),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      transaction: json['transaction'] == null
          ? null
          : TransactionModel.fromJson(
              json['transaction'] as Map<String, dynamic>),
      freezed: json['freezed'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$GiftCardModelImplToJson(_$GiftCardModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'owner': instance.owner?.toJson(),
      'code': instance.code,
      'expiresAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.expiresAt),
      'amount': instance.amount,
      'currency': instance.currency,
      'transaction': instance.transaction?.toJson(),
      'freezed': instance.freezed,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };
