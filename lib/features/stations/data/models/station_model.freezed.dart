// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StationModel _$StationModelFromJson(Map<String, dynamic> json) {
  return _StationModel.fromJson(json);
}

/// @nodoc
mixin _$StationModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<String> get phoneNumbers => throw _privateConstructorUsedError; // owner
  Map<String, ProfileModel> get owners => throw _privateConstructorUsedError;
  Map<String, ProfileModel> get technicians =>
      throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationModelCopyWith<StationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationModelCopyWith<$Res> {
  factory $StationModelCopyWith(
          StationModel value, $Res Function(StationModel) then) =
      _$StationModelCopyWithImpl<$Res, StationModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      String photoUrl,
      String? email,
      List<String> phoneNumbers,
      Map<String, ProfileModel> owners,
      Map<String, ProfileModel> technicians,
      Address address,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$StationModelCopyWithImpl<$Res, $Val extends StationModel>
    implements $StationModelCopyWith<$Res> {
  _$StationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? email = freezed,
    Object? phoneNumbers = null,
    Object? owners = null,
    Object? technicians = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumbers: null == phoneNumbers
          ? _value.phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      owners: null == owners
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      technicians: null == technicians
          ? _value.technicians
          : technicians // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
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
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StationModelImplCopyWith<$Res>
    implements $StationModelCopyWith<$Res> {
  factory _$$StationModelImplCopyWith(
          _$StationModelImpl value, $Res Function(_$StationModelImpl) then) =
      __$$StationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      String photoUrl,
      String? email,
      List<String> phoneNumbers,
      Map<String, ProfileModel> owners,
      Map<String, ProfileModel> technicians,
      Address address,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$StationModelImplCopyWithImpl<$Res>
    extends _$StationModelCopyWithImpl<$Res, _$StationModelImpl>
    implements _$$StationModelImplCopyWith<$Res> {
  __$$StationModelImplCopyWithImpl(
      _$StationModelImpl _value, $Res Function(_$StationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? email = freezed,
    Object? phoneNumbers = null,
    Object? owners = null,
    Object? technicians = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$StationModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumbers: null == phoneNumbers
          ? _value._phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      owners: null == owners
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      technicians: null == technicians
          ? _value._technicians
          : technicians // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
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
class _$StationModelImpl implements _StationModel {
  _$StationModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.name,
      required this.photoUrl,
      this.email,
      required final List<String> phoneNumbers,
      required final Map<String, ProfileModel> owners,
      required final Map<String, ProfileModel> technicians,
      required this.address,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @TimestampDateTimeSerializer() this.deletedAt})
      : _phoneNumbers = phoneNumbers,
        _owners = owners,
        _technicians = technicians;

  factory _$StationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final String? email;
  final List<String> _phoneNumbers;
  @override
  List<String> get phoneNumbers {
    if (_phoneNumbers is EqualUnmodifiableListView) return _phoneNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phoneNumbers);
  }

// owner
  final Map<String, ProfileModel> _owners;
// owner
  @override
  Map<String, ProfileModel> get owners {
    if (_owners is EqualUnmodifiableMapView) return _owners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_owners);
  }

  final Map<String, ProfileModel> _technicians;
  @override
  Map<String, ProfileModel> get technicians {
    if (_technicians is EqualUnmodifiableMapView) return _technicians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_technicians);
  }

  @override
  final Address address;
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
    return 'StationModel(ref: $ref, name: $name, photoUrl: $photoUrl, email: $email, phoneNumbers: $phoneNumbers, owners: $owners, technicians: $technicians, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._phoneNumbers, _phoneNumbers) &&
            const DeepCollectionEquality().equals(other._owners, _owners) &&
            const DeepCollectionEquality()
                .equals(other._technicians, _technicians) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ref,
      name,
      photoUrl,
      email,
      const DeepCollectionEquality().hash(_phoneNumbers),
      const DeepCollectionEquality().hash(_owners),
      const DeepCollectionEquality().hash(_technicians),
      address,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationModelImplCopyWith<_$StationModelImpl> get copyWith =>
      __$$StationModelImplCopyWithImpl<_$StationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationModelImplToJson(
      this,
    );
  }
}

abstract class _StationModel implements StationModel {
  factory _StationModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final String name,
          required final String photoUrl,
          final String? email,
          required final List<String> phoneNumbers,
          required final Map<String, ProfileModel> owners,
          required final Map<String, ProfileModel> technicians,
          required final Address address,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @TimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$StationModelImpl;

  factory _StationModel.fromJson(Map<String, dynamic> json) =
      _$StationModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  String? get email;
  @override
  List<String> get phoneNumbers;
  @override // owner
  Map<String, ProfileModel> get owners;
  @override
  Map<String, ProfileModel> get technicians;
  @override
  Address get address;
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
  _$$StationModelImplCopyWith<_$StationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
