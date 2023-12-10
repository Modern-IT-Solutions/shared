// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sim_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimTaskModelImpl _$$SimTaskModelImplFromJson(Map<String, dynamic> json) =>
    _$SimTaskModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      status: $enumDecode(_$SimTaskStatusEnumMap, json['status']),
      code: json['code'] as String,
      runner: json['runner'] == null
          ? null
          : SimModel.fromJson(json['runner'] as Map<String, dynamic>),
      type: $enumDecode(_$SimTaskTypeEnumMap, json['type']),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$SimTaskModelImplToJson(_$SimTaskModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'status': _$SimTaskStatusEnumMap[instance.status]!,
      'code': instance.code,
      'runner': instance.runner?.toJson(),
      'type': _$SimTaskTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$SimTaskStatusEnumMap = {
  SimTaskStatus.pending: 'pending',
  SimTaskStatus.runing: 'runing',
  SimTaskStatus.success: 'success',
  SimTaskStatus.canceled: 'canceled',
  SimTaskStatus.failed: 'failed',
};

const _$SimTaskTypeEnumMap = {
  SimTaskType.activate: 'activate',
  SimTaskType.recharge: 'recharge',
};
