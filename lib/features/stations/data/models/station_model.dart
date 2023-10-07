// ignore_for_file: public_member_api_docs, sort_constructors_first
/// [StationModel] is a class that represents a station

import 'package:core/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';


part 'station_model.freezed.dart';
part 'station_model.g.dart';

@freezed
class StationModel with _$StationModel implements Model {
  factory StationModel({
    @ModelRefSerializer()
    required ModelRef ref,
    required String name,
    required String photoUrl,
    String? email, 
    required List<String> phoneNumbers,
    // owner 
    required AddressModel address,
    required Map<String,ProfileModel> owners,
    required Map<String,ProfileModel> technicians,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _StationModel; 

  factory StationModel.fromJson(Map<String, dynamic> json) => _$StationModelFromJson(json);
  static ModelDescription<StationModel> get description => ModelDescription<StationModel>(
        fields: {
          FieldDescription(
            name: "name",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.name,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "email",
            type: FieldType.number,
            map: (m) => m.email,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "phoneNumbers",
            type: FieldType.listText,
            map: (m) => m.phoneNumbers,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "createdAt",
            type: FieldType.datetime,
            map: (m) => m.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "updatedAt",
            type: FieldType.datetime,
            map: (m) => m.updatedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "deletedAt",
            nullable: true,
            type: FieldType.datetime,
            map: (m) => m.deletedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "ref",
            type: FieldType.reference,
            map: (m) => m.ref,
            group: FieldGroup.metadata,
          ),
        },
        name: "Stations",
        path: "stations",
        fromJson: StationModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
          title: model.name,
          subtitle: model.email,
          leading: CircleAvatar(
            backgroundImage:model.photoUrl.isEmpty? null : NetworkImage(model.photoUrl),
            child: Center(
              child: model.photoUrl.isEmpty? const Icon(Icons.person) : null,
            ),
          ),
        ),
        actions: [],
      );

}
