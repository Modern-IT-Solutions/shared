import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'billing_item_model.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

enum BillStatus {
  panding,
  paid,
  // partiallyPaid,
  cancelled,
}

enum PaymentMethod {
  cash,
  cheque,
  // bankTransfer,
  // creditCard,
  // other,
}

@freezed
class BillModel with _$BillModel implements Model {

  factory BillModel({
    @ModelRefSerializer()
    required ModelRef ref,
    String? description,
    required double amount,
    // the paid part of the bill, user can pay a part of the bill and the rest later
    // required double paidAmount,
    @Default("DZD") String currency,
    @Default(BillStatus.panding) BillStatus status,
    // payment method
    required PaymentMethod paymentMethod,
    required List<BillingItemModel> items,


    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);
}

// extension for total
extension BillModelX on BillModel {
  // sub total
  double get subTotal {
    return items.fold(0, (previousValue, element) => previousValue + element.amount*element.quantity);
  }

  double get total {
    return subTotal + (subTotal * 0.19);
  }
}