import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'assistance_feedback.freezed.dart';
part 'assistance_feedback.g.dart';

@freezed
class AssistanceFeedback with _$AssistanceFeedback {

  factory AssistanceFeedback({
    String? note,
    // rate
    required double rate,
    // created by
    required ProfileModel profile,
    // metadata
    @Default({}) Map<String,dynamic> metadata,    
  }) = _AssistanceFeedback;

  factory AssistanceFeedback.fromJson(Map<String, dynamic> json) => _$AssistanceFeedbackFromJson(json);
}