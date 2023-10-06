


import 'package:shared/shared.dart';

import '../../data/models/station_model.dart';

class StationCreateRequest<T extends StationModel> extends CreateRequest<T> {
  /// The name of the station.
  String name;
  /// The address of the station.
  Address address;

  /// The photoUrl of the station.
  String? photoUrl;
  /// The phone numbers of the station.
  List<String> phoneNumbers;
  /// The email of the station.
  String? email;
  /// The technicians of the station.
  List<ProfileModel> technicians;

  StationCreateRequest({
    super.id,
    required this.name,
    required this.address,
    this.photoUrl,
    this.phoneNumbers = const [],
    this.email,
    this.technicians = const [],
  });
  
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? FirebaseFirestore.instance.collection('_any').doc().id,
      ...data,
    };
  }

  Map<String, dynamic> get data => {
    'name': name,
    'address': address.toJson(),
    'photoUrl': photoUrl,
    'phoneNumbers': phoneNumbers,
    'email': email,
    'technicians': technicians.map((x) => x.toJson()).toList(),
  };


  // StationCreateRequest({
  //   required this.name,
  //   required this.details,
  //   this.image,
  //   required this.location,
  //   required this.address,
  //   this.phone,
  //   this.ownerUid,
  //   this.techniciansUids,
  // });

  // StationCreateRequest copyWith({
  //   String? name,
  //   String? details,
  //   String? imageUrl,
  //   List<String>? location,
  //   String? address,
  //   String? phone,
  //   String? ownerUid,
  //   Set<String>? techniciansUids,
  // }) {
  //   return StationCreateRequest(
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

  // factory StationCreateRequest.fromMap(Map<String, dynamic> map) {
  //   return StationCreateRequest(
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

  // factory StationCreateRequest.fromJson(String source) => StationCreateRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'StationCreateRequest(name: $name, details: $details, imageUrl: $image, location: $location, address: $address, phone: $phone, ownerUid: $ownerUid, techniciansUids: $techniciansUids)';
  // }

  // @override
  // bool operator ==(covariant StationCreateRequest other) {
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
class StationUpdateRequest<T extends StationModel> extends UpdateRequest<T> {
  /// The name of the station.
  String? name;
  /// The address of the station.
  Address? address;
  /// The photoUrl of the station.
  String? photoUrl;
  /// The phone numbers of the station.
  List<String>? phoneNumbers;
  /// The email of the station.
  String? email;
  /// The technicians of the station.
  List<ProfileModel>? technicians;

  get data => toMap();

  StationUpdateRequest({
    required super.id,
    this.name,
    this.address,
    this.photoUrl,
    this.phoneNumbers,
    this.email,
    this.technicians,
  });
  
  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address?.toJson(),
      'photoUrl': photoUrl,
      'phoneNumbers': phoneNumbers,
      'email': email,
      'technicians': technicians?.map((x) => x.toJson()).toList(),
    };
  }
  }

class StationFindRequest<T extends StationModel> extends FindRequest<T> {
  const StationFindRequest({
    required super.id,
    super.withDeleted,
  });
}