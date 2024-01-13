import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/unit_statistics_model.dart';
import 'package:shared/models/unit_subject_model.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel implements Model {
  factory UnitModel({
    @ModelRefSerializer() required ModelRef ref,
    @ColorSerializer()
    // TODO: parse the color from the server
    required Color color,
    @Default("بلا وصف") String description,
    required double discount,
    required Duration duration,
    required List<String> fields,
    required String name,
    required double price,
    required String title,
    required UnitStatisticsModel statistics,
    // visibility
    @Default(ModelVisibility.visible) ModelVisibility visibility,
    required ProfileModel teacher,
    required UnitSubjectModel subject,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) => _$UnitModelFromJson(json);

  static ModelDescription<UnitModel> get modelDescription => ModelDescription<UnitModel>(
        fields: {},
        name: "Units",
        path: "units",
        fromJson: UnitModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
            title: model.name,
            subtitle: model.title,
            leading: // teacher circle
                CircleAvatar(
              backgroundImage: model.teacher.photoUrl.nullIfEmpty == null ? null : CachedNetworkImageProvider(model.teacher.photoUrl),
              child: model.teacher.photoUrl.nullIfEmpty != null ? null : Text(model.teacher.displayName.firstCharOrNull),
            )),
        actions: [],
      );
}

/// extension to the [UnitModel]
extension UnitModelEx on UnitModel {
  get total {
    return price - discount;
  }
}

enum ModelVisibility {
  visible(Colors.green, Icons.visibility),
  hidden(Colors.red, Icons.visibility_off);

  const ModelVisibility(this.color,this.icon);
  final Color color;
  final IconData icon;
}
