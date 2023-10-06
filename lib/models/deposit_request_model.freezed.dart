// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepositRequestModel _$DepositRequestModelFromJson(Map<String, dynamic> json) {
  return _DepositRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DepositRequestModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  DepositRequestStatus get status => throw _privateConstructorUsedError;
  ProfileModel get profile => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError; // currency
  String get currency => throw _privateConstructorUsedError; // note
  String? get note => throw _privateConstructorUsedError; // attachment
  List<AttachmentModel>? get attachments =>
      throw _privateConstructorUsedError; // address
  String? get address => throw _privateConstructorUsedError; // phone number
  String? get phoneNumber => throw _privateConstructorUsedError; // first name
  String? get firstName => throw _privateConstructorUsedError; // last name
  String? get lastName => throw _privateConstructorUsedError; // baladiya
  String? get municipal => throw _privateConstructorUsedError; // alwilaya
  String? get state =>
      throw _privateConstructorUsedError; // reference of the transaction
  String? get reference => throw _privateConstructorUsedError; // transaction
  TransactionModel? get transaction =>
      throw _privateConstructorUsedError; // method of the transaction
  PaymentMethod get method => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositRequestModelCopyWith<DepositRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositRequestModelCopyWith<$Res> {
  factory $DepositRequestModelCopyWith(
          DepositRequestModel value, $Res Function(DepositRequestModel) then) =
      _$DepositRequestModelCopyWithImpl<$Res, DepositRequestModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String uid,
      DepositRequestStatus status,
      ProfileModel profile,
      double amount,
      String currency,
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
      PaymentMethod method,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  $ProfileModelCopyWith<$Res> get profile;
  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$DepositRequestModelCopyWithImpl<$Res, $Val extends DepositRequestModel>
    implements $DepositRequestModelCopyWith<$Res> {
  _$DepositRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? uid = null,
    Object? status = null,
    Object? profile = null,
    Object? amount = null,
    Object? currency = null,
    Object? note = freezed,
    Object? attachments = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? municipal = freezed,
    Object? state = freezed,
    Object? reference = freezed,
    Object? transaction = freezed,
    Object? method = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositRequestStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      municipal: freezed == municipal
          ? _value.municipal
          : municipal // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profile {
    return $ProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionModelCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionModelCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DepositRequestModelImplCopyWith<$Res>
    implements $DepositRequestModelCopyWith<$Res> {
  factory _$$DepositRequestModelImplCopyWith(_$DepositRequestModelImpl value,
          $Res Function(_$DepositRequestModelImpl) then) =
      __$$DepositRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String uid,
      DepositRequestStatus status,
      ProfileModel profile,
      double amount,
      String currency,
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
      PaymentMethod method,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $ProfileModelCopyWith<$Res> get profile;
  @override
  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$DepositRequestModelImplCopyWithImpl<$Res>
    extends _$DepositRequestModelCopyWithImpl<$Res, _$DepositRequestModelImpl>
    implements _$$DepositRequestModelImplCopyWith<$Res> {
  __$$DepositRequestModelImplCopyWithImpl(_$DepositRequestModelImpl _value,
      $Res Function(_$DepositRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? uid = null,
    Object? status = null,
    Object? profile = null,
    Object? amount = null,
    Object? currency = null,
    Object? note = freezed,
    Object? attachments = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? municipal = freezed,
    Object? state = freezed,
    Object? reference = freezed,
    Object? transaction = freezed,
    Object? method = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DepositRequestModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DepositRequestStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      municipal: freezed == municipal
          ? _value.municipal
          : municipal // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepositRequestModelImpl implements _DepositRequestModel {
  _$DepositRequestModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.uid,
      required this.status,
      required this.profile,
      required this.amount,
      this.currency = 'DZD',
      this.note,
      final List<AttachmentModel>? attachments,
      this.address,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.municipal,
      this.state,
      this.reference,
      this.transaction,
      required this.method,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @TimestampDateTimeSerializer() this.deletedAt})
      : _attachments = attachments,
        _metadata = metadata;

  factory _$DepositRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositRequestModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final String uid;
  @override
  final DepositRequestStatus status;
  @override
  final ProfileModel profile;
  @override
  final double amount;
// currency
  @override
  @JsonKey()
  final String currency;
// note
  @override
  final String? note;
// attachment
  final List<AttachmentModel>? _attachments;
// attachment
  @override
  List<AttachmentModel>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// address
  @override
  final String? address;
// phone number
  @override
  final String? phoneNumber;
// first name
  @override
  final String? firstName;
// last name
  @override
  final String? lastName;
// baladiya
  @override
  final String? municipal;
// alwilaya
  @override
  final String? state;
// reference of the transaction
  @override
  final String? reference;
// transaction
  @override
  final TransactionModel? transaction;
// method of the transaction
  @override
  final PaymentMethod method;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  @TimestampDateTimeSerializer()
  final DateTime createdAt;
  @override
  @TimestampDateTimeSerializer()
  final DateTime updatedAt;
  @override
  @TimestampDateTimeSerializer()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'DepositRequestModel(ref: $ref, uid: $uid, status: $status, profile: $profile, amount: $amount, currency: $currency, note: $note, attachments: $attachments, address: $address, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, municipal: $municipal, state: $state, reference: $reference, transaction: $transaction, method: $method, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositRequestModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.municipal, municipal) ||
                other.municipal == municipal) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ref,
        uid,
        status,
        profile,
        amount,
        currency,
        note,
        const DeepCollectionEquality().hash(_attachments),
        address,
        phoneNumber,
        firstName,
        lastName,
        municipal,
        state,
        reference,
        transaction,
        method,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt,
        deletedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositRequestModelImplCopyWith<_$DepositRequestModelImpl> get copyWith =>
      __$$DepositRequestModelImplCopyWithImpl<_$DepositRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DepositRequestModel implements DepositRequestModel {
  factory _DepositRequestModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final String uid,
          required final DepositRequestStatus status,
          required final ProfileModel profile,
          required final double amount,
          final String currency,
          final String? note,
          final List<AttachmentModel>? attachments,
          final String? address,
          final String? phoneNumber,
          final String? firstName,
          final String? lastName,
          final String? municipal,
          final String? state,
          final String? reference,
          final TransactionModel? transaction,
          required final PaymentMethod method,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @TimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$DepositRequestModelImpl;

  factory _DepositRequestModel.fromJson(Map<String, dynamic> json) =
      _$DepositRequestModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  String get uid;
  @override
  DepositRequestStatus get status;
  @override
  ProfileModel get profile;
  @override
  double get amount;
  @override // currency
  String get currency;
  @override // note
  String? get note;
  @override // attachment
  List<AttachmentModel>? get attachments;
  @override // address
  String? get address;
  @override // phone number
  String? get phoneNumber;
  @override // first name
  String? get firstName;
  @override // last name
  String? get lastName;
  @override // baladiya
  String? get municipal;
  @override // alwilaya
  String? get state;
  @override // reference of the transaction
  String? get reference;
  @override // transaction
  TransactionModel? get transaction;
  @override // method of the transaction
  PaymentMethod get method;
  @override
  Map<String, dynamic> get metadata;
  @override
  @TimestampDateTimeSerializer()
  DateTime get createdAt;
  @override
  @TimestampDateTimeSerializer()
  DateTime get updatedAt;
  @override
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$DepositRequestModelImplCopyWith<_$DepositRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
