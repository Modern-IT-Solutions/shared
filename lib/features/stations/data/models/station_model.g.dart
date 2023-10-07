// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationModelImpl _$$StationModelImplFromJson(Map<String, dynamic> json) =>
    _$StationModelImpl(
      ref: const ModelRefSerializer().fromJson(json['ref'] as String),
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      email: json['email'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      owners: (json['owners'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ProfileModel.fromJson(e as Map<String, dynamic>)),
      ),
      technicians: (json['technicians'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ProfileModel.fromJson(e as Map<String, dynamic>)),
      ),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: const TimestampDateTimeSerializer()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$StationModelImplToJson(_$StationModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'email': instance.email,
      'phoneNumbers': instance.phoneNumbers,
      'owners': instance.owners.map((k, e) => MapEntry(k, e.toJson())),
      'technicians':
          instance.technicians.map((k, e) => MapEntry(k, e.toJson())),
      'address': instance.address.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt':
          const TimestampDateTimeSerializer().toJson(instance.deletedAt),
    };
