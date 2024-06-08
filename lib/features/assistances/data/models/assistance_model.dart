import 'package:core/modules/chat/room/embedded_chat_room_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/features/assistances/data/models/assistance_feedback.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/intervention_model.dart';
import 'package:shared/shared.dart';

import '../../../stations/stations.dart';
import 'assistant_modification_history.dart';

part 'assistance_model.freezed.dart';
part 'assistance_model.g.dart';

@freezed
class AssistanceModel with _$AssistanceModel implements Model {
  const AssistanceModel._();

  const factory AssistanceModel({
    @ModelRefSerializer() required ModelRef ref,
    required StationModel station,
    required List<ProfileModel> technicians,
    required List<String> techniciansRefs,
    required AssistanceStatus status,
    @TimestampDateTimeSerializer() required DateTime date,
    required String note,
    required List<AttachmentModel> attachments,
    required ProfileModel? reviewer,
    required InterventionModel? intervention,
    // embedded chat room
    EmbeddedChatRoomModel? embeddedChatRoom,
    // feedback
    AssistanceFeedback? feedback,
    // metadata
    @Default({}) Map<String, dynamic> metadata,
    @NullableTimestampDateTimeSerializer() DateTime? nextInterventionDate,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _AssistanceModel;

  factory AssistanceModel.fromJson(Map<String, dynamic> json) => _$AssistanceModelFromJson(json);

  static ModelDescription<AssistanceModel> get description => ModelDescription<AssistanceModel>(
        fields: {
          FieldDescription(
            name: "station.name",
            path: "station.name",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.station.name,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "reviewer name",
            path: "reviewer.displayName",
            type: FieldType.text,
            map: (m) => m.reviewer?.displayName,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "reviewer uid",
            path: "reviewer.uid",
            type: FieldType.text,
            map: (m) => m.reviewer?.uid,
            group: FieldGroup.primary,
          ),
          // phoneNumber
          FieldDescription(
            name: "reviewer phoneNumber",
            path: "reviewer.phoneNumber",
            type: FieldType.text,
            map: (m) => m.reviewer?.phoneNumber,
            group: FieldGroup.primary,
          ),
          // email
          FieldDescription(
            name: "reviewer email",
            path: "reviewer.email",
            type: FieldType.text,
            map: (m) => m.reviewer?.email,
            group: FieldGroup.primary,
          ),
          // intervention
          FieldDescription(
            name: "intervention ref",
            path: "intervention.ref",
            type: FieldType.text,
            map: (m) => m.intervention?.ref.path,
            group: FieldGroup.primary,
          ),
          // intervention createdAt
          FieldDescription(
            name: "intervention createdAt",
            path: "intervention.createdAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.createdAt,
            group: FieldGroup.primary,
          ),
          // intervention updatedAt
          FieldDescription(
            name: "intervention updatedAt",
            path: "intervention.updatedAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.updatedAt,
            group: FieldGroup.primary,
          ),
          // intervention deletedAt
          FieldDescription(
            name: "intervention deletedAt",
            path: "intervention.deletedAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.deletedAt,
            group: FieldGroup.primary,
          ),
          // intervention status
          FieldDescription(
            name: "intervention status",
            path: "intervention.status",
            type: FieldType.text,
            map: (m) => m.intervention?.status.name,
            group: FieldGroup.primary,
          ),
          // bill dates
          FieldDescription(
            name: "bill createdAt",
            path: "intervention.bill.createdAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.bill?.createdAt,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "bill updatedAt",
            path: "intervention.bill.updatedAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.bill?.updatedAt,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "bill deletedAt",
            path: "intervention.bill.deletedAt",
            type: FieldType.datetime,
            map: (m) => m.intervention?.bill?.deletedAt,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "Assistance ref",
            path: "ref",
            type: FieldType.text,
            map: (m) => m.ref,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "Assistance createdAt",
            path: "createdAt",
            type: FieldType.datetime,
            map: (m) => m.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "Assistance updatedAt",
            path: "updatedAt",
            type: FieldType.datetime,
            map: (m) => m.updatedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "Assistance deletedAt",
            path: "deletedAt",
            nullable: true,
            type: FieldType.datetime,
            map: (m) => m.deletedAt,
            group: FieldGroup.metadata,
          ),
        },
        name: "Assistances Requests",
        path: "assistances",
        fromJson: AssistanceModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(title: model.station.name, subtitle: model.reviewer?.displayName ?? ("(No reviewer)")),
        actions: [],
      );
}

/// [AssistanceStatus] is enum that represents the status of the request assistance.
///  it contains : [Draft], [Pending], [InReview], [Resolved]
enum AssistanceStatus {
  /// The request assistance is in draft.
  // draft(Colors.orangeAccent),

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
      // AssistanceStatus.draft: "Broullion",
      AssistanceStatus.pending: "En attente",
      AssistanceStatus.inReview: "En instance",
      AssistanceStatus.resolved: "Résolue",
      AssistanceStatus.cancelled: "Annulée",
    };
    return map[this] ?? "";
  }
}

// extention for AssistantModificationHistory
extension AssistantHistoryEx on AssistanceModel {
  List<AssistantModificationHistory> get timeline {
    var list = <AssistantModificationHistory>[];
    if (metadata.containsKey("timeline")) {
      var timeline = metadata["timeline"] as List;
      for (var item in timeline) {
        list.add(AssistantModificationHistory.fromJson(item));
      }
    }
    return list;
  }
}
