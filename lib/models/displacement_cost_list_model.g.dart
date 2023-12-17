// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'displacement_cost_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisplacementCostModelImpl _$$DisplacementCostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplacementCostModelImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$DisplacementCostModelImplToJson(
        _$DisplacementCostModelImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'cost': instance.cost,
    };
