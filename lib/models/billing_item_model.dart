import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_item_model.freezed.dart';
part 'billing_item_model.g.dart';

@freezed
class BillingItemModel with _$BillingItemModel implements Model {

  factory BillingItemModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required String image,
    required String name,
    required String description,
    required double amount,
    required String currency,
    required int quantity,
    // meta data
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _BillingItemModel;

  factory BillingItemModel.fromJson(Map<String, dynamic> json) => _$BillingItemModelFromJson(json);
}