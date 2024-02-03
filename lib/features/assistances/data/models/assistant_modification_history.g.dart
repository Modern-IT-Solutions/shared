// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistant_modification_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssistantModificationHistoryImpl _$$AssistantModificationHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantModificationHistoryImpl(
      date: const TimestampDateTimeSerializer().fromJson(json['date']),
      note: json['note'] as String?,
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      changes: json['changes'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$AssistantModificationHistoryImplToJson(
        _$AssistantModificationHistoryImpl instance) =>
    <String, dynamic>{
      'date': const TimestampDateTimeSerializer().toJson(instance.date),
      'note': instance.note,
      'profile': instance.profile.toJson(),
      'changes': instance.changes,
      'status': instance.status,
      'metadata': instance.metadata,
    };
