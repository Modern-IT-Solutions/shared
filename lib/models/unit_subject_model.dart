import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'unit_subject_model.freezed.dart';
part 'unit_subject_model.g.dart';

@freezed
class UnitSubjectModel with _$UnitSubjectModel implements Model {

  factory UnitSubjectModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required String name,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
  @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _UnitSubjectModel;

  factory UnitSubjectModel.fromJson(Map<String, dynamic> json) => _$UnitSubjectModelFromJson(json);
}