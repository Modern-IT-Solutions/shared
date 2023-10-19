// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillModelImpl _$$BillModelImplFromJson(Map<String, dynamic> json) =>
    _$BillModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      number: json['number'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: $enumDecode(_$BillStatusEnumMap, json['status']),
      items: (json['items'] as List<dynamic>)
          .map((e) => BillingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$BillModelImplToJson(_$BillModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'number': instance.number,
      'description': instance.description,
      'amount': instance.amount,
      'paidAmount': instance.paidAmount,
      'currency': instance.currency,
      'status': _$BillStatusEnumMap[instance.status]!,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$BillStatusEnumMap = {
  BillStatus.draft: 'draft',
  BillStatus.sent: 'sent',
  BillStatus.paid: 'paid',
  BillStatus.partiallyPaid: 'partiallyPaid',
  BillStatus.cancelled: 'cancelled',
};
