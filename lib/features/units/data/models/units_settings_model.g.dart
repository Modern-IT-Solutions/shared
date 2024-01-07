// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitsSettingsModelImpl _$$UnitsSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitsSettingsModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UnitsSettingsModelImplToJson(
        _$UnitsSettingsModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
      'subjects': instance.subjects,
      'fields': instance.fields,
    };
