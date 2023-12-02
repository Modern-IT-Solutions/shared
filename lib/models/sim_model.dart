import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import 'register_task_model.dart';

part 'sim_model.freezed.dart';
part 'sim_model.g.dart';

/// [SimStatus] is enum that represents the status of the intervention.
enum SimStatus {
  enabled,
  disabled,
}

@freezed
class SimModel with _$SimModel implements Model {

  factory SimModel({
    @ModelRefSerializer()
    required ModelRef ref,
    // name
    required String name,
    // phone number
    required String phoneNumber,
    // operator
    required NetworkOperator operator,
    // pin code
    String? pinCode,
    // balance
    @Default(0) double balance,
    // bonusBalance
    @Default(0) double bonusBalance,
    // status
    required SimStatus status,
    // lastBalanceFetchAt
    required double lastBalanceFetchAt,
    // lastBonusBalanceFetchAt
    required double lastBonusBalanceFetchAt,

    // meta..
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _SimModel;

  factory SimModel.fromJson(Map<String, dynamic> json) => _$SimModelFromJson(json);
}