// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentModelImpl _$$AttachmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachmentModelImpl(
      uploadBy: json['uploadBy'] as String?,
      mimeType: json['mimeType'] as String?,
      name: json['name'] as String?,
      src: json['src'] as String,
    );

Map<String, dynamic> _$$AttachmentModelImplToJson(
        _$AttachmentModelImpl instance) =>
    <String, dynamic>{
      'uploadBy': instance.uploadBy,
      'mimeType': instance.mimeType,
      'name': instance.name,
      'src': instance.src,
    };
