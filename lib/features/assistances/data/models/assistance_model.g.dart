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
      technicians: (json['technicians'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ProfileModel.fromJson(e as Map<String, dynamic>)),
      ),
      status: $enumDecode(_$AssistanceStatusEnumMap, json['status']),
      date: const TimestampDateTimeSerializer().fromJson(json['date']),
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
      nextInterventionDate: const NullableTimestampDateTimeSerializer()
          .fromJson(json['nextInterventionDate']),
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$AssistanceModelImplToJson(
        _$AssistanceModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'station': instance.station.toJson(),
      'technicians':
          instance.technicians.map((k, e) => MapEntry(k, e.toJson())),
      'status': _$AssistanceStatusEnumMap[instance.status]!,
      'date': const TimestampDateTimeSerializer().toJson(instance.date),
      'note': instance.note,
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'reviewer': instance.reviewer?.toJson(),
      'intervention': instance.intervention?.toJson(),
      'nextInterventionDate': const NullableTimestampDateTimeSerializer()
          .toJson(instance.nextInterventionDate),
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };

const _$AssistanceStatusEnumMap = {
  AssistanceStatus.draft: 'draft',
  AssistanceStatus.pending: 'pending',
  AssistanceStatus.inReview: 'inReview',
  AssistanceStatus.resolved: 'resolved',
  AssistanceStatus.cancelled: 'cancelled',
};
