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
      createdAt: const TimestampDateTimeSerializer()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const TimestampDateTimeSerializer()
          .fromJson(json['updatedAt'] as Timestamp),
      deletedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['deletedAt'], const TimestampDateTimeSerializer().fromJson),
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
      'deletedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deletedAt, const TimestampDateTimeSerializer().toJson),
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
