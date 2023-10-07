// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      uid: json['uid'] as String,
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
          TransactionType.transfer,
      product: json['product'] as String?,
      from: json['from'] as String,
      to: json['to'] as String,
      uids: (json['uids'] as List<dynamic>).map((e) => e as String).toList(),
      promocode: json['promocode'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? "DZD",
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      details: json['details'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'uid': instance.uid,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'product': instance.product,
      'from': instance.from,
      'to': instance.to,
      'uids': instance.uids,
      'promocode': instance.promocode,
      'amount': instance.amount,
      'currency': instance.currency,
      'metadata': instance.metadata,
      'details': instance.details,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.success: 'success',
  TransactionStatus.failed: 'failed',
};

const _$TransactionTypeEnumMap = {
  TransactionType.deposit: 'deposit',
  TransactionType.withdraw: 'withdraw',
  TransactionType.purchase: 'purchase',
  TransactionType.refund: 'refund',
  TransactionType.transfer: 'transfer',
};
