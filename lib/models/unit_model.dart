import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/models/unit_statistics_model.dart';
import 'package:shared/models/unit_subject_model.dart';
import 'package:shared/shared.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel implements Model {

  factory UnitModel({
    @ModelRefSerializer()
    required ModelRef ref,
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
    @Default(UnitVisibility.visible) UnitVisibility visibility,
    required ProfileModel teacher,
    required UnitSubjectModel subject,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @TimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _UnitModel; 

  factory UnitModel.fromJson(Map<String, dynamic> json) => _$UnitModelFromJson(json);
  
} 

/// extension to the [UnitModel]
extension UnitModelEx on UnitModel {
 
  get total {
    return price - discount;
  }

}


enum UnitVisibility {
  visible,
  hidden,
}