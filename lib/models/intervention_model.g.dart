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
      nextInterventionDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['nextInterventionDate'],
          const TimestampDateTimeSerializer().fromJson),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: const TimestampDateTimeSerializer()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const TimestampDateTimeSerializer()
          .fromJson(json['updatedAt'] as Timestamp),
      deletedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['deletedAt'], const TimestampDateTimeSerializer().fromJson),
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
      'nextInterventionDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.nextInterventionDate,
          const TimestampDateTimeSerializer().toJson),
      'metadata': instance.metadata,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deletedAt, const TimestampDateTimeSerializer().toJson),
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
