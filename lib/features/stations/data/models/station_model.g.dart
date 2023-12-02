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
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      owners: (json['owners'] as List<dynamic>)
          .map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownersRefs: (json['ownersRefs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      technicians: (json['technicians'] as List<dynamic>)
          .map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      techniciansRefs: (json['techniciansRefs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt:
          const TimestampDateTimeSerializer().fromJson(json['createdAt']),
      updatedAt:
          const TimestampDateTimeSerializer().fromJson(json['updatedAt']),
      deletedAt: const NullableTimestampDateTimeSerializer()
          .fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$StationModelImplToJson(_$StationModelImpl instance) =>
    <String, dynamic>{
      'ref': const ModelRefSerializer().toJson(instance.ref),
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'email': instance.email,
      'phoneNumbers': instance.phoneNumbers,
      'address': instance.address.toJson(),
      'owners': instance.owners.map((e) => e.toJson()).toList(),
      'ownersRefs': instance.ownersRefs,
      'technicians': instance.technicians.map((e) => e.toJson()).toList(),
      'techniciansRefs': instance.techniciansRefs,
      'createdAt':
          const TimestampDateTimeSerializer().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt': const NullableTimestampDateTimeSerializer()
          .toJson(instance.deletedAt),
    };
