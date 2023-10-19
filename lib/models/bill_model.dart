import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'billing_item_model.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

enum BillStatus {
  draft,
  sent,
  paid,
  partiallyPaid,
  cancelled,
}

@freezed
class BillModel with _$BillModel implements Model {

  factory BillModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required String number,
    required String description,
    required double amount,
    // the paid part of the bill, user can pay a part of the bill and the rest later
    required double paidAmount,
    required String currency,
    required BillStatus status,
    
    required List<BillingItemModel> items,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);
}