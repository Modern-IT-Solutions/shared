// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/models/transaction_model.dart';

class DepositRequestCreateRequest<T extends DepositRequestModel> extends UpdateRequest<T> {
  String uid;
  // enum
  DepositRequestStatus status;
  ProfileModel profile;
  double amount;
  // not;
  String? note;
  // attachmen;
  List<AttachmentModel>? attachments;
  // addres;
  String? address;
  // phone numbe;
  String? phoneNumber;
  // first nam;
  String? firstName;
  // last nam;
  String? lastName;
  // baladiy;
  String? municipal;
  // alwilay;
  String? state;
  // reference of the transactio;
  String reference;
  // transactio;
  TransactionModel? transaction;
  // method of the transactio;
  // enum
  PaymentMethod method;
  String currency;
  Map<String, dynamic> metadata;
  DateTime? updatedAt;
  DateTime? deletedAt;
  DepositRequestCreateRequest({
    required super.id,
    required this.uid,
    required this.status,
    required this.profile,
    required this.amount,
    this.note,
    this.attachments,
    this.address,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.municipal,
    this.state,
    required this.reference,
    this.transaction,
    required this.method,
    required this.currency,
    required this.metadata,
    this.updatedAt,
    this.deletedAt,
  });


  DepositRequestCreateRequest<T> copyWith({
    String? id,
    String? uid,
    DepositRequestStatus? status,
    ProfileModel? profile,
    double? amount,
    String? note,
    List<AttachmentModel>? attachments,
    String? address,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? municipal,
    String? state,
    String? reference,
    TransactionModel? transaction,
    PaymentMethod? method,
    String? currency,
    Map<String, dynamic>? metadata,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return DepositRequestCreateRequest<T>(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      status: status ?? this.status,
      profile: profile ?? this.profile,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      attachments: attachments ?? this.attachments,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      municipal: municipal ?? this.municipal,
      state: state ?? this.state,
      reference: reference ?? this.reference,
      transaction: transaction ?? this.transaction,
      method: method ?? this.method,
      currency: currency ?? this.currency,
      metadata: metadata ?? this.metadata,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'status': status.index,
      'profile': profile.toJson(),
      'amount': amount,
      'note': note,
      'attachments': attachments?.map((x) => x?.toJson()).toList() ?? [],
      'address': address,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'municipal': municipal,
      'state': state,
      'reference': reference,
      'transaction': transaction?.toJson(),
      'method': method.index,
      'currency': currency,
      'metadata': metadata,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  factory DepositRequestCreateRequest.fromJson(Map<String, dynamic> map) {
    return DepositRequestCreateRequest<T>(
      id: map['id'] as String,
      uid: map['uid'] as String,
      status: DepositRequestStatus.values[map['status'] as int],
      profile: ProfileModel.fromJson(map['profile'] as Map<String,dynamic>),
      amount: map['amount'] as double,
      note: map['note'] != null ? map['note'] as String : null,
      attachments: map['attachments'] != null ? List<AttachmentModel>.from((map['attachments'] as List<int>).map<AttachmentModel?>((x) => AttachmentModel.fromJson(x as Map<String,dynamic>),),) : null,
      address: map['address'] != null ? map['address'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      municipal: map['municipal'] != null ? map['municipal'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      reference: map['reference'] as String,
      transaction: map['transaction'] != null ? TransactionModel.fromJson(map['transaction'] as Map<String,dynamic>) : null,
      method: PaymentMethod.values[map['method'] as int],
      currency: map['currency'] as String,
      metadata: Map<String, dynamic>.from((map['metadata'] as Map<String, dynamic> )),
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
      deletedAt: map['deletedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int) : null,
    );
  }


  @override
  String toString() {
    return 'DepositRequestUpdateRequest(id: $id, uid: $uid, status: $status, profile: $profile, amount: $amount, note: $note, attachments: $attachments, address: $address, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, municipal: $municipal, state: $state, reference: $reference, transaction: $transaction, method: $method, currency: $currency, metadata: $metadata, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant DepositRequestCreateRequest<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.uid == uid &&
      other.status == status &&
      other.profile == profile &&
      other.amount == amount &&
      other.note == note &&
      listEquals(other.attachments, attachments) &&
      other.address == address &&
      other.phoneNumber == phoneNumber &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.municipal == municipal &&
      other.state == state &&
      other.reference == reference &&
      other.transaction == transaction &&
      other.method == method &&
      other.currency == currency &&
      mapEquals(other.metadata, metadata) &&
      other.updatedAt == updatedAt &&
      other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      uid.hashCode ^
      status.hashCode ^
      profile.hashCode ^
      amount.hashCode ^
      note.hashCode ^
      attachments.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      municipal.hashCode ^
      state.hashCode ^
      reference.hashCode ^
      transaction.hashCode ^
      method.hashCode ^
      currency.hashCode ^
      metadata.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
  }
}



class DepositRequestUpdateRequest<T extends DepositRequestModel> extends UpdateRequest<T> {
  String? uid;
  // enum
  DepositRequestStatus? status;
  ProfileModel? profile;
  double? amount;
  // not;
  String? note;
  // attachmen;
  List<AttachmentModel>? attachments;
  // addres;
  String? address;
  // phone numbe;
  String? phoneNumber;
  // first nam;
  String? firstName;
  // last nam;
  String? lastName;
  // baladiy;
  String? municipal;
  // alwilay;
  String? state;
  // reference of the transactio;
  String? reference;
  // transactio;
  TransactionModel? transaction;
  // method of the transactio;
  // enum
  PaymentMethod? method;
  String? currency;
  Map<String, dynamic>? metadata;
  DateTime? updatedAt;
  DateTime? deletedAt;
  DepositRequestUpdateRequest({
    required super.id,
    this.uid,
    this.status,
    this.profile,
    this.amount,
    this.note,
    this.attachments,
    this.address,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.municipal,
    this.state,
    this.reference,
    this.transaction,
    this.method,
    this.currency,
    this.metadata,
    this.updatedAt,
    this.deletedAt,
  });


  DepositRequestUpdateRequest<T> copyWith({
    String? id,
    String? uid,
    DepositRequestStatus? status,
    ProfileModel? profile,
    double? amount,
    String? note,
    List<AttachmentModel>? attachments,
    String? address,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? municipal,
    String? state,
    String? reference,
    TransactionModel? transaction,
    PaymentMethod? method,
    String? currency,
    Map<String, dynamic>? metadata,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return DepositRequestUpdateRequest<T>(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      status: status ?? this.status,
      profile: profile ?? this.profile,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      attachments: attachments ?? this.attachments,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      municipal: municipal ?? this.municipal,
      state: state ?? this.state,
      reference: reference ?? this.reference,
      transaction: transaction ?? this.transaction,
      method: method ?? this.method,
      currency: currency ?? this.currency,
      metadata: metadata ?? this.metadata,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'status': status?.index,
      'profile': profile?.toJson(),
      'amount': amount,
      'note': note,
      'attachments': attachments?.map((x) => x?.toJson()).toList(),
      'address': address,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'municipal': municipal,
      'state': state,
      'reference': reference,
      'transaction': transaction?.toJson(),
      'method': method?.index,
      'currency': currency,
      'metadata': metadata,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  factory DepositRequestUpdateRequest.fromJson(Map<String, dynamic> map) {
    return DepositRequestUpdateRequest<T>(
      id: map['id'] as String,
      uid: map['uid'] != null ? map['uid'] as String : null,
      status: map['status'] != null ? DepositRequestStatus?.values[map['status'] as int] : null,
      profile: map['profile'] != null ? ProfileModel.fromJson(map['profile'] as Map<String,dynamic>) : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
      attachments: map['attachments'] != null ? List<AttachmentModel>.from((map['attachments'] as List<int>).map<AttachmentModel?>((x) => AttachmentModel.fromJson(x as Map<String,dynamic>),),) : null,
      address: map['address'] != null ? map['address'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      municipal: map['municipal'] != null ? map['municipal'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      reference: map['reference'] != null ? map['reference'] as String : null,
      transaction: map['transaction'] != null ? TransactionModel.fromJson(map['transaction'] as Map<String,dynamic>) : null,
      method: map['method'] != null ? PaymentMethod?.values[map['method'] as int] : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      metadata: map['metadata'] != null ? Map<String, dynamic>.from((map['metadata'] as Map<String, dynamic> )) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
      deletedAt: map['deletedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int) : null,
    );
  }



  @override
  String toString() {
    return 'DepositRequestUpdateRequest(id: $id, uid: $uid, status: $status, profile: $profile, amount: $amount, note: $note, attachments: $attachments, address: $address, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, municipal: $municipal, state: $state, reference: $reference, transaction: $transaction, method: $method, currency: $currency, metadata: $metadata, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant DepositRequestUpdateRequest<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.uid == uid &&
      other.status == status &&
      other.profile == profile &&
      other.amount == amount &&
      other.note == note &&
      listEquals(other.attachments, attachments) &&
      other.address == address &&
      other.phoneNumber == phoneNumber &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.municipal == municipal &&
      other.state == state &&
      other.reference == reference &&
      other.transaction == transaction &&
      other.method == method &&
      other.currency == currency &&
      mapEquals(other.metadata, metadata) &&
      other.updatedAt == updatedAt &&
      other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      uid.hashCode ^
      status.hashCode ^
      profile.hashCode ^
      amount.hashCode ^
      note.hashCode ^
      attachments.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      municipal.hashCode ^
      state.hashCode ^
      reference.hashCode ^
      transaction.hashCode ^
      method.hashCode ^
      currency.hashCode ^
      metadata.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
  }
}

class DepositRequestFindRequest<T extends DepositRequestModel> extends FindRequest<T> {
  const DepositRequestFindRequest({
    required super.id,
    super.withDeleted,
  });
}
