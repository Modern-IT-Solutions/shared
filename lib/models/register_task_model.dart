import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/sim_model.dart';

import '../shared.dart';

part 'register_task_model.freezed.dart';
part 'register_task_model.g.dart';

/// [RegisterTaskStatus] is enum that represents the status of the intervention.
enum RegisterTaskStatus {
  pending,
  inProgress,
  success,
  canceled,
  failed;
}

// [NetworkOperator] is enum that represents the status of the intervention.
enum NetworkOperator {
  ooredoo,
  djezzy,
  mobilis
}


/// [RegisterTaskModel]  is abstract class that represents the intervention that the client requested.
@freezed
class RegisterTaskModel with _$RegisterTaskModel implements Model {

  factory RegisterTaskModel({
    @ModelRefSerializer()
    required ModelRef ref,

    // status
    required RegisterTaskStatus status,
    // profile
    required ProfileModel profile,
    // operator
    required NetworkOperator operator,
    // sim
    required SimModel sim,
    // requestedSimId
    required String rsid, 
    // 

    // meta..
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,

  }) = _RegisterTaskModel;

  factory RegisterTaskModel.fromJson(Map<String, dynamic> json) => _$RegisterTaskModelFromJson(json);
}