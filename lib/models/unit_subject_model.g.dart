// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitSubjectModelImpl _$$UnitSubjectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitSubjectModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      name: json['name'] as String,
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt:
          const TimestampDateTimeSerializer().fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$UnitSubjectModelImplToJson(
        _$UnitSubjectModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'name': instance.name,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': _$JsonConverterToJson<dynamic, DateTime>(
          instance.deletedAt, const TimestampDateTimeSerializer().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
