import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'attachment_model.dart';
import 'transaction_model.dart';

part 'deposit_request_model.freezed.dart';
part 'deposit_request_model.g.dart';

@freezed
class DepositRequestModel with _$DepositRequestModel implements Model {  
  factory DepositRequestModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required String uid,
    required DepositRequestStatus status,
    required ProfileModel profile,
    required double amount,
    // currency
    @Default('DZD') String currency,
    // note
    String? note,
    // attachment
    List<AttachmentModel>? attachments,
    // address
    String? address,
    // phone number
    String? phoneNumber,
    // first name
    String? firstName,
    // last name
    String? lastName,
    // baladiya
    String? municipal,
    // alwilaya
    String? state,
    // reference of the transaction
    String? reference,
    // transaction
    TransactionModel? transaction,
    // method of the transaction
    required PaymentMethod method,
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @TimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _DepositRequestModel;

  factory DepositRequestModel.fromJson(Map<String, dynamic> json) => _$DepositRequestModelFromJson(json);

  static ModelDescription<DepositRequestModel> get description => ModelDescription<DepositRequestModel>(
        fields: {
          FieldDescription(
            name: "status",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.status.name,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "amount",
            type: FieldType.number,
            map: (m) => m.amount,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "currency",
            type: FieldType.text,
            map: (m) => m.currency,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "uid",
            type: FieldType.listText,
            map: (m) => m.uid,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "createdAt",
            type: FieldType.datetime,
            map: (m) => m.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "updatedAt",
            type: FieldType.datetime,
            map: (m) => m.updatedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "deletedAt",
            nullable: true,
            type: FieldType.datetime,
            map: (m) => m.deletedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "ref",
            type: FieldType.reference,
            map: (m) => m.ref,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "firstName",
            type: FieldType.text,
            map: (m) => m.firstName,
            group: FieldGroup.secondary,
          ),
          FieldDescription(
            name: "lastName",
            type: FieldType.text,
            map: (m) => m.lastName,
            group: FieldGroup.secondary,
          ),
        },
        name: "Deposit Requests",
        path: "depositRequests",
        fromJson: DepositRequestModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
          title: model.status.name + " " + model.amount.toString() + " " + model.currency,
        ),
        actions: [],
      );
}


/// enum [DepositRequestStatus] is an enum that represents the status of the deposit request.
enum DepositRequestStatus {
  /// DepositRequestStatus.pending
  pending,

  /// DepositRequestStatus.success
  inReview,

  /// DepositRequestStatus.needsAction
  needsAction,

  /// DepositRequestStatus.accepted
  accepted,

  /// DepositRequestStatus.rejected
  rejected;


  /// color
  Color get color {
    switch (this) {
      case DepositRequestStatus.pending:
        return Colors.yellow;
      case DepositRequestStatus.inReview:
        return Colors.blue;
      case DepositRequestStatus.needsAction:
        return Colors.red;
      case DepositRequestStatus.accepted:
        return Colors.green;
      case DepositRequestStatus.rejected:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (this) {
      case DepositRequestStatus.pending:
        return Icons.timer;
      case DepositRequestStatus.inReview:
        return Icons.pending_actions;
      case DepositRequestStatus.needsAction:
        return Icons.pending_actions;
      case DepositRequestStatus.accepted:
        return Icons.check;
      case DepositRequestStatus.rejected:
        return Icons.close;
      default:
        return Icons.pending;
    }
  }
}

/// enum [PaymentMethod] is an enum that represents the method of the payment.
enum PaymentMethod {
  baridiMob,
  ccp,
  edahabia,
  cash,
  other,
}

extension  DepositRequestFullNameExtension on DepositRequestModel {
  String? get fullName {
    var name = '${firstName ?? ""} ${lastName ?? ""}'.trim();
    if (name.isEmpty) {
      return null;
    }
    return name;
  }
}