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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UnitSubjectModelImplToJson(
        _$UnitSubjectModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };
