import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/shared.dart';

part 'unit_section_model.freezed.dart';
part 'unit_section_model.g.dart';


@freezed
class UnitSectionModel with _$UnitSectionModel implements Model {

  factory UnitSectionModel({
    @ModelRefSerializer() required ModelRef ref,
    required String title,
    String? description,
    required int order,
    @Default(false) bool isFree,
    @Default(ModelVisibility.visible) ModelVisibility visibility,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _UnitSectionModel;

  factory UnitSectionModel.fromJson(Map<String, dynamic> json) => _$UnitSectionModelFromJson(json);


  static ModelDescription<UnitSectionModel> get modelDescription => ModelDescription<UnitSectionModel>(
        fields: {},
        name: "Sections",
        path: "sections",
        fromJson: UnitSectionModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
            title: model.title,
            subtitle: model.description,
        ),
        actions: [],
      );
}