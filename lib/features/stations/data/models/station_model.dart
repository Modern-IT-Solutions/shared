// ignore_for_file: public_member_api_docs, sort_constructors_first
/// [StationModel] is a class that represents a station

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
    required List<ProfileModel> technicians,
    required Address address,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @TimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _StationModel;

  factory StationModel.fromJson(Map<String, dynamic> json) => _$StationModelFromJson(json);
}
