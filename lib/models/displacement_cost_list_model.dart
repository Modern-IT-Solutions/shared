import 'package:freezed_annotation/freezed_annotation.dart';

part 'displacement_cost_list_model.freezed.dart';
part 'displacement_cost_list_model.g.dart';

@freezed
class DisplacementCostModel with _$DisplacementCostModel {

  factory DisplacementCostModel({
    required String from,
    required String to,
    required double cost,
  }) = _DisplacementCostModel;

  factory DisplacementCostModel.fromJson(Map<String, dynamic> json) => _$DisplacementCostModelFromJson(json);
}