import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'bill_item_template_model.freezed.dart';
part 'bill_item_template_model.g.dart';

@freezed
class BillItemTemplateModel with _$BillItemTemplateModel {

  factory BillItemTemplateModel({
    String? reference,
    required String name,
    String? description,
    String? category,
    required double price,
    @Default(true) bool enabled,
  }) = _BillItemTemplateModel;

  factory BillItemTemplateModel.fromJson(Map<String, dynamic> json) => _$BillItemTemplateModelFromJson(json);
}