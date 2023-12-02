// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterTaskModelImpl _$$RegisterTaskModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterTaskModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      status: $enumDecode(_$RegisterTaskStatusEnumMap, json['status']),
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      operator: $enumDecode(_$NetworkOperatorEnumMap, json['operator']),
      sim: SimModel.fromJson(json['sim'] as Map<String, dynamic>),
      rsid: json['rsid'] as String,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$RegisterTaskModelImplToJson(
        _$RegisterTaskModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'status': _$RegisterTaskStatusEnumMap[instance.status]!,
      'profile': instance.profile.toJson(),
      'operator': _$NetworkOperatorEnumMap[instance.operator]!,
      'sim': instance.sim.toJson(),
      'rsid': instance.rsid,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$RegisterTaskStatusEnumMap = {
  RegisterTaskStatus.pending: 'pending',
  RegisterTaskStatus.inProgress: 'inProgress',
  RegisterTaskStatus.success: 'success',
  RegisterTaskStatus.canceled: 'canceled',
  RegisterTaskStatus.failed: 'failed',
};

const _$NetworkOperatorEnumMap = {
  NetworkOperator.ooredoo: 'ooredoo',
  NetworkOperator.djezzy: 'djezzy',
  NetworkOperator.mobilis: 'mobilis',
};
