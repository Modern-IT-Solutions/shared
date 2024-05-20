import 'package:flutter/material.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/models/unit_section_item_model.dart';
import 'package:shared/models/unit_section_model.dart';
import 'package:shared/models/unit_statistics_model.dart';
import 'package:shared/models/unit_subject_model.dart';
import 'package:shared/shared.dart';

import '../../data/models/station_model.dart';

class UnitUpdateRequest<T extends UnitModel> extends UpdateRequest<T> {
  final ModelRef ref;

  Color? color;
  double? discount;
  double? price;
  Duration? duration;
  List<String>? fields;
  UnitStatisticsModel? statistics;
  UnitSubjectModel? subject;
  ProfileModel? teacher;

  String? name;
  String? title;
  String? description;
  int? order;

  ModelVisibility? visibility;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  Map<String, dynamic>? metadata;

  get data => toMap();

  UnitUpdateRequest({
    required this.ref,
    this.name,
    this.title,
    this.description,
    this.order,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.color,
    this.discount,
    this.price,
    this.duration,
    this.fields,
    this.statistics,
    this.subject,
    this.teacher,
    this.metadata,
  }) : super(id: ref.id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'ref': ref.path,
      'name': name,
      'title': title,
      'description': description,
      'order': order,
      'visibility': visibility?.name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'color': color?.value,
      'discount': discount,
      'price': price,
      'duration': duration?.inMicroseconds,
      'fields': fields,
      'statistics': statistics?.toJson() ?? {},
      'subject': subject?.toJson(),
      'teacher': teacher?.toJson(),
      'metadata': metadata,
    };
  }
}

class UnitFindRequest<T extends UnitModel> extends FindRequest<T> {
  const UnitFindRequest({
    required super.id,
    super.withDeleted,
  });
}
