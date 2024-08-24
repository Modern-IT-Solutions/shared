// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeAdImpl _$$HomeAdImplFromJson(Map<String, dynamic> json) => _$HomeAdImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      link: json['link'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      type: $enumDecode(_$HomeSectionTypeEnumMap, json['type']),
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$HomeAdImplToJson(_$HomeAdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'link': instance.link,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': _$HomeSectionTypeEnumMap[instance.type]!,
      'enabled': instance.enabled,
    };

const _$HomeSectionTypeEnumMap = {
  HomeSectionType.popup: 'popup',
  HomeSectionType.other: 'other',
};
