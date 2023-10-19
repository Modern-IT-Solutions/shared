import 'package:shared/models/unit_model.dart';
import 'package:shared/models/unit_section_item_model.dart';
import 'package:shared/models/unit_section_model.dart';
import 'package:shared/shared.dart';

import '../../data/models/station_model.dart';

class UnitSectionCreateRequest<T extends UnitSectionModel> extends CreateRequest<T> {
  /// The name of the station.
  String name;

  /// The address of the station.
  AddressModel address;

  /// The photoUrl of the station.
  String? photoUrl;

  /// The phone numbers of the station.
  List<String> phoneNumbers;

  /// The email of the station.
  String? email;

  /// The technicians of the station.
  Map<String, ProfileModel> technicians;
  Map<String, ProfileModel> owners;

  UnitSectionCreateRequest({
    super.id,
    required this.name,
    required this.address,
    this.photoUrl,
    this.phoneNumbers = const [],
    this.email,
    this.technicians = const {},
    this.owners = const {},
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
        'technicians': technicians
            . // must be Map<String, Map<String, dynamic>>
            map((key, value) => MapEntry(key, value.toJson())),
        'owners': owners
            . // must be Map<String, Map<String, dynamic>>
            map((key, value) => MapEntry(key, value.toJson())),
      };

  // UnitSectionCreateRequest({
  //   required this.name,
  //   required this.details,
  //   this.image,
  //   required this.location,
  //   required this.address,
  //   this.phone,
  //   this.ownerUid,
  //   this.techniciansUids,
  // });

  // UnitSectionCreateRequest copyWith({
  //   String? name,
  //   String? details,
  //   String? imageUrl,
  //   List<String>? location,
  //   String? address,
  //   String? phone,
  //   String? ownerUid,
  //   Set<String>? techniciansUids,
  // }) {
  //   return UnitSectionCreateRequest(
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

  // factory UnitSectionCreateRequest.fromMap(Map<String, dynamic> map) {
  //   return UnitSectionCreateRequest(
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

  // factory UnitSectionCreateRequest.fromJson(String source) => UnitSectionCreateRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'UnitSectionCreateRequest(name: $name, details: $details, imageUrl: $image, location: $location, address: $address, phone: $phone, ownerUid: $ownerUid, techniciansUids: $techniciansUids)';
  // }

  // @override
  // bool operator ==(covariant UnitSectionCreateRequest other) {
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



class UnitSectionUpdateRequest<T extends UnitSectionModel> extends UpdateRequest<T> {
  final ModelRef ref;
  String? title;
  String? description;
  int? order;
  bool? isFree;

  ModelVisibility? visibility;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  get data => toMap();

  UnitSectionUpdateRequest({
    required this.ref,
    this.title,
    this.description,
    this.order,
    this.isFree,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super(id: ref.id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'ref': ref.path,
      'title': title,
      'description': description,
      'order': order,
      'isFree': isFree,
      'visibility': visibility?.name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}

class UnitSectionFindRequest<T extends UnitSectionModel> extends FindRequest<T> {
  const UnitSectionFindRequest({
    required super.id,
    super.withDeleted,
  });
}
