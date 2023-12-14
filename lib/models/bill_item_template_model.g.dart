// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_item_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillItemTemplateModelImpl _$$BillItemTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BillItemTemplateModelImpl(
      reference: json['reference'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$BillItemTemplateModelImplToJson(
        _$BillItemTemplateModelImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'enabled': instance.enabled,
    };
