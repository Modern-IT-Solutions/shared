// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillModelImpl _$$BillModelImplFromJson(Map<String, dynamic> json) =>
    _$BillModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? "DZD",
      status: $enumDecodeNullable(_$BillStatusEnumMap, json['status']) ??
          BillStatus.pending,
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      items: (json['items'] as List<dynamic>)
          .map((e) => BillingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$BillModelImplToJson(_$BillModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': _$BillStatusEnumMap[instance.status]!,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$BillStatusEnumMap = {
  BillStatus.pending: 'pending',
  BillStatus.paid: 'paid',
  BillStatus.unpaid: 'unpaid',
  BillStatus.received: 'received',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.cheque: 'cheque',
};
