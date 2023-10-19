// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_section_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitSectionItemModelImpl _$$UnitSectionItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnitSectionItemModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      type: $enumDecode(_$UnitSectionItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String?,
      order: json['order'] as int,
      isFree: json['isFree'] as bool? ?? false,
      url: json['url'] as String? ?? "",
      hash: json['hash'] as String? ?? "",
      poster: json['poster'] as String?,
      isLive: json['isLive'] as bool? ?? false,
      useYoutubePlayer: json['useYoutubePlayer'] as bool? ?? false,
      visibility:
          $enumDecodeNullable(_$ModelVisibilityEnumMap, json['visibility']) ??
              ModelVisibility.visible,
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UnitSectionItemModelImplToJson(
        _$UnitSectionItemModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'type': _$UnitSectionItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'order': instance.order,
      'isFree': instance.isFree,
      'url': instance.url,
      'hash': instance.hash,
      'poster': instance.poster,
      'isLive': instance.isLive,
      'useYoutubePlayer': instance.useYoutubePlayer,
      'visibility': _$ModelVisibilityEnumMap[instance.visibility]!,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$UnitSectionItemTypeEnumMap = {
  UnitSectionItemType.doc: 'doc',
  UnitSectionItemType.live: 'live',
  UnitSectionItemType.video: 'video',
  UnitSectionItemType.quiz: 'quiz',
};

const _$ModelVisibilityEnumMap = {
  ModelVisibility.visible: 'visible',
  ModelVisibility.hidden: 'hidden',
};
