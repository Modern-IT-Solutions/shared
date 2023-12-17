// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'displacement_cost_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisplacementCostModelImpl _$$DisplacementCostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplacementCostModelImpl(
      region: json['region'] as String,
      state: json['state'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$DisplacementCostModelImplToJson(
        _$DisplacementCostModelImpl instance) =>
    <String, dynamic>{
      'region': instance.region,
      'state': instance.state,
      'cost': instance.cost,
    };
