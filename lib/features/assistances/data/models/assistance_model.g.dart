// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssistanceModelImpl _$$AssistanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistanceModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      station: StationModel.fromJson(json['station'] as Map<String, dynamic>),
      technicians: (json['technicians'] as List<dynamic>)
          .map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$AssistanceStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewer: json['reviewer'] == null
          ? null
          : ProfileModel.fromJson(json['reviewer'] as Map<String, dynamic>),
      intervention: json['intervention'] == null
          ? null
          : InterventionModel.fromJson(
              json['intervention'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$AssistanceModelImplToJson(
        _$AssistanceModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'station': instance.station.toJson(),
      'technicians': instance.technicians.map((e) => e.toJson()).toList(),
      'status': _$AssistanceStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'reviewer': instance.reviewer?.toJson(),
      'intervention': instance.intervention?.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };

const _$AssistanceStatusEnumMap = {
  AssistanceStatus.draft: 'draft',
  AssistanceStatus.pending: 'pending',
  AssistanceStatus.inReview: 'inReview',
  AssistanceStatus.resolved: 'resolved',
  AssistanceStatus.cancelled: 'cancelled',
};
