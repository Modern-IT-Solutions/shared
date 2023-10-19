
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/intervention_model.dart';
import 'package:shared/shared.dart';

import '../../../stations/stations.dart';

part 'assistance_model.freezed.dart';
part 'assistance_model.g.dart';

@freezed
class AssistanceModel with _$AssistanceModel implements Model {
  factory AssistanceModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required StationModel station,
    required Map<String,ProfileModel> technicians,
    required AssistanceStatus status,
    required DateTime date,
    required String note,
    required List<AttachmentModel> attachments,
    required ProfileModel? reviewer,
    required InterventionModel? intervention,
    @NullableTimestampDateTimeSerializer()
    DateTime? nextInterventionDate,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _AssistanceModel;

  factory AssistanceModel.fromJson(Map<String, dynamic> json) => _$AssistanceModelFromJson(json);


  static ModelDescription<AssistanceModel> get description => ModelDescription<AssistanceModel>(
        fields: {
          FieldDescription(
            name: "station",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.station.name,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "reviewer",
            type: FieldType.text,
            map: (m) => m.reviewer?.displayName,
            group: FieldGroup.primary,
          ),
        },
        name: "Assistances Requests",
        path: "assistances",
        fromJson: AssistanceModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
          title: model.station.name,
          subtitle: model.reviewer?.displayName ?? ("(No reviewer)")
        ),
        actions: [],
      );
}



/// [AssistanceStatus] is enum that represents the status of the request assistance.
///  it contains : [Draft], [Pending], [InReview], [Resolved]
enum AssistanceStatus {
  /// The request assistance is in draft.
  draft(Colors.orangeAccent),

  /// The request assistance is pending.
  pending(Colors.orange),

  /// The request assistance is in review.
  inReview(Colors.green),

  /// The request assistance is resolved.
  resolved(Colors.blueAccent),

  /// The request assistance is cancelled
  cancelled(Colors.redAccent);

  const AssistanceStatus(this.color);
  final Color color;

  String toFrenchName() {
    var map = {
      AssistanceStatus.draft: "Broullion",
      AssistanceStatus.pending: "En attente",
      AssistanceStatus.inReview: "En instance",
      AssistanceStatus.resolved: "Résolue",
      AssistanceStatus.cancelled: "Annulée",
    };
    return map[this] ?? "";
  }
}
