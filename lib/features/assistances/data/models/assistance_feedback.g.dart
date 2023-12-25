// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistance_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssistanceFeedbackImpl _$$AssistanceFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistanceFeedbackImpl(
      note: json['note'] as String?,
      rate: (json['rate'] as num).toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$AssistanceFeedbackImplToJson(
        _$AssistanceFeedbackImpl instance) =>
    <String, dynamic>{
      'note': instance.note,
      'rate': instance.rate,
      'metadata': instance.metadata,
    };
