import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'assistant_modification_history.freezed.dart';
part 'assistant_modification_history.g.dart';

@freezed
class AssistantModificationHistory with _$AssistantModificationHistory {

  factory AssistantModificationHistory({
    @TimestampDateTimeSerializer()
    required DateTime date,
    String? note,
    required ProfileModel profile,
    Map<String,dynamic>? changes,
    @Default({}) Map<String,dynamic> metadata,
  }) = _AssistantModificationHistory;

  factory AssistantModificationHistory.fromJson(Map<String, dynamic> json) => _$AssistantModificationHistoryFromJson(json);
}