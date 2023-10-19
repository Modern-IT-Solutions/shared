// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillingItemModelImpl _$$BillingItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BillingItemModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      quantity: json['quantity'] as int,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$BillingItemModelImplToJson(
        _$BillingItemModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'quantity': instance.quantity,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };
