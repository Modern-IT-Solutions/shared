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

  static List<UnitSubjectModel> get values => [
    /// ARABIC, ENGLISH, MATH, SCIENCE, ISLAMIC_STUDIES, ART, PHYSICS, FRENCH, GERMAN, SPANISH, PHILOSOPHY,HISTORY_AND_GEOGRAPHY
    UnitSubjectModel(
      ref: ModelRef("subjects/ARABIC_2AS"),
      name: "اللغة العربية سنة ثانية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/MATH_2AS"),
      name: "الرياضيات سنة ثانية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/PHYSICS_2AS"),
      name: "الفيزياء سنة ثانية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/ENGLISH"),
      name: "الإنجليزية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/SCIENCE"),
      name: "العلوم",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/ISLAMIC_STUDIES"),
      name: "التربية الإسلامية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/ART"),
      name: "التربية الفنية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/FRENCH"),
      name: "اللغة الفرنسية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/GERMAN"),
      name: "اللغة الألمانية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/SPANISH"),
      name: "اللغة الإسبانية",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/PHILOSOPHY"),
      name: "الفلسفة",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UnitSubjectModel(
      ref: ModelRef("subjects/HISTORY_AND_GEOGRAPHY"),
      name: "التاريخ والجغرافيا",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}