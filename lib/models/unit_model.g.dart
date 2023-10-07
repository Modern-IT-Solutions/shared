// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitModelImpl _$$UnitModelImplFromJson(Map<String, dynamic> json) =>
    _$UnitModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      color: const ColorSerializer().fromJson(json['color'] as int),
      description: json['description'] as String? ?? "بلا وصف",
      discount: (json['discount'] as num).toDouble(),
      duration: Duration(microseconds: json['duration'] as int),
      fields:
          (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      statistics: UnitStatisticsModel.fromJson(
          json['statistics'] as Map<String, dynamic>),
      visibility:
          $enumDecodeNullable(_$UnitVisibilityEnumMap, json['visibility']) ??
              UnitVisibility.visible,
      teacher: ProfileModel.fromJson(json['teacher'] as Map<String, dynamic>),
      subject:
          UnitSubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$UnitModelImplToJson(_$UnitModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'color': const ColorSerializer().toJson(instance.color),
      'description': instance.description,
      'discount': instance.discount,
      'duration': instance.duration.inMicroseconds,
      'fields': instance.fields,
      'name': instance.name,
      'price': instance.price,
      'title': instance.title,
      'statistics': instance.statistics.toJson(),
      'visibility': _$UnitVisibilityEnumMap[instance.visibility]!,
      'teacher': instance.teacher.toJson(),
      'subject': instance.subject.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };

const _$UnitVisibilityEnumMap = {
  UnitVisibility.visible: 'visible',
  UnitVisibility.hidden: 'hidden',
};
