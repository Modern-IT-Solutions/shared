import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/sim_model.dart';
import 'package:shared/shared.dart';

part 'sim_task_model.freezed.dart';
part 'sim_task_model.g.dart';

enum SimTaskStatus {
  pending,
  runing,
  success,
  canceled,
  failed;
}

/// SimTaskType
enum SimTaskType {
  /// activate a sim line
  activate,
  /// recharge a sim line
  recharge,
}


@freezed
class SimTaskModel with _$SimTaskModel implements Model {

  factory SimTaskModel({
    @ModelRefSerializer()
    required ModelRef ref,
    
    // name
    required SimTaskStatus status,
    // code
    required String code,
    // runner
    SimModel? runner,
    // type
    required SimTaskType type,


    // meta..
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _SimTaskModel;

  factory SimTaskModel.fromJson(Map<String, dynamic> json) => _$SimTaskModelFromJson(json);
}