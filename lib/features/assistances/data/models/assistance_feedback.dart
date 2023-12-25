import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistance_feedback.freezed.dart';
part 'assistance_feedback.g.dart';

@freezed
class AssistanceFeedback with _$AssistanceFeedback {

  factory AssistanceFeedback({
    String? note,
    // rate
    required double rate,
    // metadata
    @Default({}) Map<String,dynamic> metadata,    
  }) = _AssistanceFeedback;

  factory AssistanceFeedback.fromJson(Map<String, dynamic> json) => _$AssistanceFeedbackFromJson(json);
}