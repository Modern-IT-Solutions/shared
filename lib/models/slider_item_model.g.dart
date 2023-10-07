// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderItemImpl _$$SliderItemImplFromJson(Map<String, dynamic> json) =>
    _$SliderItemImpl(
      type: $enumDecode(_$SliderItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String?,
      src: json['src'] as String,
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$SliderItemImplToJson(_$SliderItemImpl instance) =>
    <String, dynamic>{
      'type': _$SliderItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'src': instance.src,
      'action': instance.action,
    };

const _$SliderItemTypeEnumMap = {
  SliderItemType.image: 'image',
  SliderItemType.video: 'video',
  SliderItemType.widget: 'widget',
};
