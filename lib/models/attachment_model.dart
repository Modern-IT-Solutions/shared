import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
class AttachmentModel with _$AttachmentModel {

  factory AttachmentModel({
    String? uploadBy,
    String? mimeType,
    String? name,
    required String src,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);
}