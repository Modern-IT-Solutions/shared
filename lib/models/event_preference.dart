

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_preference.freezed.dart';
part 'event_preference.g.dart';

@freezed
class EventPreference with _$EventPreference {

  factory EventPreference({
    required String id,
    required String title,
    String? description,
    @Default(EventType.info) EventType type,
    String? action, 
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime date,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
  }) = _EventPreference;

  factory EventPreference.fromJson(Map<String, dynamic> json) => _$EventPreferenceFromJson(json);

}




/// enum [EventType] is an enum that represents the type of the event.
enum EventType {
  /// EventType.info
  info,
  live,
  exam,
  unit,
  section,
  item,
}