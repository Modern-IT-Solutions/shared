
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/features/stations/data/models/station_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/shared.dart';

part 'intervention_model.freezed.dart';
part 'intervention_model.g.dart';

/// [InterventionModel]  is abstract class that represents the intervention that the client requested.
/// it contains :  status is [InterventionStatus], date is [Timestamp],
/// description is [String], [Items] is list of [Item], type is [InterventionType], [Intervener] is [Profile],

@freezed
class InterventionModel with _$InterventionModel implements Model {

  factory InterventionModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required InterventionStatus status,
    required DateTime date,
    required String description,
    // required List<AttachmentModel> attachments,
    required List<AttachmentModel> attachments,
    required InterventionType type,
    required ProfileModel intervener,
    // next intervention date
    @NullableTimestampDateTimeSerializer()
    DateTime? nextInterventionDate,
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _InterventionModel;

  factory InterventionModel.fromJson(Map<String, dynamic> json) => _$InterventionModelFromJson(json);
}

/// [InterventionStatus] is enum that represents the status of the intervention.
/// it contains : [Pending], [InProgress], [Completed], [Canceled]

enum InterventionStatus {
  /// The intervention is pending.
  pending,

  /// The intervention is in progress.
  inProgress,

  /// The intervention is completed.
  completed,

  /// The intervention is canceled.
  canceled,
}

/// [InterventionType] is enum that represents the type of the intervention.
/// it contains : [onSite], [byPhone]
enum InterventionType {
  /// The intervention is on site.
  onSite,

  /// The intervention is by phone.
  byPhone,
}
