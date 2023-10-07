// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositRequestModelImpl _$$DepositRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DepositRequestModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      uid: json['uid'] as String,
      status: $enumDecode(_$DepositRequestStatusEnumMap, json['status']),
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'DZD',
      note: json['note'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      municipal: json['municipal'] as String?,
      state: json['state'] as String?,
      reference: json['reference'] as String?,
      transaction: json['transaction'] == null
          ? null
          : TransactionModel.fromJson(
              json['transaction'] as Map<String, dynamic>),
      method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$DepositRequestModelImplToJson(
        _$DepositRequestModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'uid': instance.uid,
      'status': _$DepositRequestStatusEnumMap[instance.status]!,
      'profile': instance.profile.toJson(),
      'amount': instance.amount,
      'currency': instance.currency,
      'note': instance.note,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'municipal': instance.municipal,
      'state': instance.state,
      'reference': instance.reference,
      'transaction': instance.transaction?.toJson(),
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$DepositRequestStatusEnumMap = {
  DepositRequestStatus.pending: 'pending',
  DepositRequestStatus.inReview: 'inReview',
  DepositRequestStatus.needsAction: 'needsAction',
  DepositRequestStatus.accepted: 'accepted',
  DepositRequestStatus.rejected: 'rejected',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.baridiMob: 'baridiMob',
  PaymentMethod.ccp: 'ccp',
  PaymentMethod.edahabia: 'edahabia',
  PaymentMethod.cash: 'cash',
  PaymentMethod.other: 'other',
};
