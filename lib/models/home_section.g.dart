// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeSectionImpl _$$HomeSectionImplFromJson(Map<String, dynamic> json) =>
    _$HomeSectionImpl(
      id: json['id'] as String,
      enabled: json['enabled'] as bool,
      order: (json['order'] as num).toInt(),
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String,
      units: (json['units'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$HomeSectionImplToJson(_$HomeSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'order': instance.order,
      'subtitle': instance.subtitle,
      'title': instance.title,
      'units': instance.units,
    };
