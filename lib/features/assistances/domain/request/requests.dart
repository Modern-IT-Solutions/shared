


import 'package:core/core.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:shared/features/stations/data/models/station_model.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/intervention_model.dart';
import 'package:shared/models/unit_model.dart';

import '../../data/models/assistance_model.dart';

class AssistanceCreateRequest<T extends AssistanceModel> extends CreateRequest<T> {
  /// The name of the assistance.
  String name;
  /// The address of the assistance.
  String address;
  /// The location of the assistance.
  GeoFirePoint location; 

  /// The photoUrl of the assistance.
  String? photoUrl;
  /// The phone numbers of the assistance.
  List<String> phoneNumbers;
  /// The email of the assistance.
  String? email;
  /// The technicians of the assistance.
  Map<String,ProfileModel> technicians;

  AssistanceCreateRequest({
    super.id,
    required this.name,
    required this.address,
    required this.location,
    this.photoUrl,
    this.phoneNumbers = const [],
    this.email,
    this.technicians = const {},
  });
  
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? FirebaseFirestore.instance.collection('_any').doc().id,
      'name': name,
      'address': address,
      'location': location.data,
      'photoUrl': photoUrl,
      'phoneNumbers': phoneNumbers,
      'email': email,
      'technicians': technicians?. // must be Map<String,Map<String,dynamic>>
        map((key, value) => MapEntry(key, value.toJson())),
    };
  }


  // AssistanceCreateRequest({
  //   required this.name,
  //   required this.details,
  //   this.image,
  //   required this.location,
  //   required this.address,
  //   this.phone,
  //   this.ownerUid,
  //   this.techniciansUids,
  // });

  // AssistanceCreateRequest copyWith({
  //   String? name,
  //   String? details,
  //   String? imageUrl,
  //   List<String>? location,
  //   String? address,
  //   String? phone,
  //   String? ownerUid,
  //   Set<String>? techniciansUids,
  // }) {
  //   return AssistanceCreateRequest(
  //     name: name ?? this.name,
  //     details: details ?? this.details,
  //     image: imageUrl ?? this.image,
  //     location: location ?? this.location,
  //     address: address ?? this.address,
  //     phone: phone ?? this.phone,
  //     ownerUid: ownerUid ?? this.ownerUid,
  //     techniciansUids: techniciansUids ?? this.techniciansUids,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'details': details,
  //     'imageUrl': image,
  //     'location': location,
  //     'address': address,
  //     'phone': phone,
  //     'ownerUid': ownerUid,
  //     'techniciansUids': techniciansUids?.toList(),
  //   };
  // }

  // factory AssistanceCreateRequest.fromMap(Map<String, dynamic> map) {
  //   return AssistanceCreateRequest(
  //     name: map['name'] as String,
  //     details: map['details'] as String,
  //     image: map['imageUrl'] != null ? map['imageUrl'] as String : null,
  //     location: List<String>.from((map['location'] as List<String>)),
  //     address: map['address'] as String,
  //     phone: map['phone'] != null ? map['phone'] as String : null,
  //     ownerUid: map['ownerUid'] != null ? map['ownerUid'] as String : null,
  //     techniciansUids: map['techniciansUids'] != null ? Set<String>.from((map['techniciansUids'] as Set<String>)) : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AssistanceCreateRequest.fromJson(String source) => AssistanceCreateRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'AssistanceCreateRequest(name: $name, details: $details, imageUrl: $image, location: $location, address: $address, phone: $phone, ownerUid: $ownerUid, techniciansUids: $techniciansUids)';
  // }

  // @override
  // bool operator ==(covariant AssistanceCreateRequest other) {
  //   if (identical(this, other)) return true;
  
  //   return 
  //     other.name == name &&
  //     other.details == details &&
  //     other.image == image &&
  //     listEquals(other.location, location) &&
  //     other.address == address &&
  //     other.phone == phone &&
  //     other.ownerUid == ownerUid &&
  //     setEquals(other.techniciansUids, techniciansUids);
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //     details.hashCode ^
  //     image.hashCode ^
  //     location.hashCode ^
  //     address.hashCode ^
  //     phone.hashCode ^
  //     ownerUid.hashCode ^
  //     techniciansUids.hashCode;
  // }
}


    // @ModelRefSerializer()
    // required ModelRef ref,
    // required StationModel station,
    // required Map<String,ProfileModel> technicians,
    // required AssistanceStatus status,
    // required DateTime date,
    // required String note,
    // required List<AttachmentModel> attachments,
    // required ProfileModel? reviewer,
    // required InterventionModel? intervention,
    // @NullableTimestampDateTimeSerializer()
    // DateTime? nextInterventionDate,
    // @TimestampDateTimeSerializer()
    // required DateTime createdAt,
    // @TimestampDateTimeSerializer()
    // required DateTime updatedAt,
    // @NullableTimestampDateTimeSerializer()
    // DateTime? deletedAt,

class AssistanceUpdateRequest<T extends AssistanceModel> {
  ModelRef ref;
  StationModel? station;
  List<ProfileModel>? technicians;
  AssistanceStatus? status;
  DateTime? date;
  String? note;
  List<AttachmentModel>? attachments;
  ProfileModel? reviewer;
  InterventionModel? intervention;
  DateTime? nextInterventionDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  ModelVisibility? visibility;
  

  Map<String, dynamic> get data => toMap();

  AssistanceUpdateRequest({
    required this.ref,
    this.station, 
    this.technicians,
    this.status,
    this.date,
    this.note,
    this.attachments,
    this.reviewer,
    this.intervention,
    this.nextInterventionDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.visibility,
  });
  
  @override
  Map<String, dynamic> toMap() {
    return {
      'ref': ref.path,
      'station': station?.toJson(),
      'technicians': technicians?.map((x) => x.toJson()).toList(),
      'techniciansRefs': technicians?.map((x) => x.ref.path).toList(),
      'status': status?.name,
      'date': date,
      'note': note,
      'attachments': attachments?.map((x) => x.toJson()).toList(),
      'reviewer': reviewer?.toJson(),
      'intervention': intervention?.toJson(),
      'nextInterventionDate': nextInterventionDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'visibility': visibility?.name,
    };
  }
  }

class AssistanceFindRequest<T extends AssistanceModel> extends FindRequest<T> {
  const AssistanceFindRequest({
    required super.id,
    super.withDeleted,
  });
}