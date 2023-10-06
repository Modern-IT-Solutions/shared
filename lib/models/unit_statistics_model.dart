import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_statistics_model.freezed.dart';
part 'unit_statistics_model.g.dart';

@freezed
class UnitStatisticsModel with _$UnitStatisticsModel {

  factory UnitStatisticsModel({
    @Default(0) int ratings,
    @Default(5) double rating,
    @Default(0) int students,
    @Default(0) int sections,
    @Default(0) int interactives,
    @Default(0) int items,
    @Default(0) int lives,
    @Default(0) int videos,
    @Default(0) int documents,
    @Default(0) int podcasts,
    @Default(0) int images,
    @Default(0) int games,
    @Default(0) int quizzes,
    @Default(0) int assignments,
    @Default(0) int exams,
    @Default(0) int discussions,
    @Default(0) int announcements,
    @Default(0) int comments,
    @Default(0) int replies,
    @Default(0) int likes,
    @Default(0) int dislikes,
    @Default(0) int views,
    @Default(0) int downloads,
    @Default(0) int shares,
    @Default(0) int messages,
    @Default(0) int privateMessages,
    @Default(0) int posts,
  }) = _UnitStatisticsModel;

  factory UnitStatisticsModel.fromJson(Map<String, dynamic> json) => _$UnitStatisticsModelFromJson(json);
}