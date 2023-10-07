// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InterventionModelImpl _$$InterventionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InterventionModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      status: $enumDecode(_$InterventionStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      attachments: json['attachments'] as List<dynamic>,
      type: $enumDecode(_$InterventionTypeEnumMap, json['type']),
      intervener:
          ProfileModel.fromJson(json['intervener'] as Map<String, dynamic>),
      nextInterventionDate: const TimestampDateTimeSerializer()
          .fromJson(json['nextInterventionDate'] as Timestamp?),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$InterventionModelImplToJson(
        _$InterventionModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'status': _$InterventionStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'attachments': instance.attachments,
      'type': _$InterventionTypeEnumMap[instance.type]!,
      'intervener': instance.intervener.toJson(),
      'nextInterventionDate': const TimestampDateTimeSerializer()
          .toJson(instance.nextInterventionDate),
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };

const _$InterventionStatusEnumMap = {
  InterventionStatus.pending: 'pending',
  InterventionStatus.inProgress: 'inProgress',
  InterventionStatus.completed: 'completed',
  InterventionStatus.canceled: 'canceled',
};

const _$InterventionTypeEnumMap = {
  InterventionType.onSite: 'onSite',
  InterventionType.byPhone: 'byPhone',
};
