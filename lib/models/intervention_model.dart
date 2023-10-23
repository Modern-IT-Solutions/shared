
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared/features/stations/data/models/station_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/bill_model.dart';
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
    BillModel? bill,
    // next intervention date
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
  pending(Colors.orange),

  /// The intervention is in progress
  accepted(Colors.blue),

  /// The intervention is completed.
  completed(Colors.green),

  /// The intervention is canceled.
  canceled(Colors.red);

  /// [color] is the color of the status.
  final Color color;
  const InterventionStatus(this.color);
}

/// [InterventionType] is enum that represents the type of the intervention.
/// it contains : [onSite], [byPhone]
enum InterventionType {
  /// The intervention is on site.
  onSite(Icons.location_on),

  /// The intervention is by phone.
  byPhone(Icons.phone);

  const InterventionType(this.icon);
  final IconData icon;
}
