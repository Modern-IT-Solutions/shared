// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitSectionModelImpl _$$UnitSectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitSectionModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      order: (json['order'] as num).toInt(),
      isFree: json['isFree'] as bool? ?? false,
      visibility:
          $enumDecodeNullable(_$ModelVisibilityEnumMap, json['visibility']) ??
              ModelVisibility.visible,
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$UnitSectionModelImplToJson(
        _$UnitSectionModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'title': instance.title,
      'description': instance.description,
      'order': instance.order,
      'isFree': instance.isFree,
      'visibility': _$ModelVisibilityEnumMap[instance.visibility]!,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$ModelVisibilityEnumMap = {
  ModelVisibility.visible: 'visible',
  ModelVisibility.hidden: 'hidden',
};
