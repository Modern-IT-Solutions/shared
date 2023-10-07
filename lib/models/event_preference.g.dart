// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventPreferenceImpl _$$EventPreferenceImplFromJson(
        Map<String, dynamic> json) =>
    _$EventPreferenceImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      type: $enumDecodeNullable(_$EventTypeEnumMap, json['type']) ??
          EventType.info,
      action: json['action'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EventPreferenceImplToJson(
        _$EventPreferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$EventTypeEnumMap[instance.type]!,
      'action': instance.action,
      'metadata': instance.metadata,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$EventTypeEnumMap = {
  EventType.info: 'info',
  EventType.live: 'live',
  EventType.exam: 'exam',
  EventType.unit: 'unit',
  EventType.section: 'section',
  EventType.item: 'item',
};
