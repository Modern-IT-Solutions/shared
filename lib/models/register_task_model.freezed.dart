// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterTaskModel _$RegisterTaskModelFromJson(Map<String, dynamic> json) {
  return _RegisterTaskModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterTaskModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError; // status
  RegisterTaskStatus get status =>
      throw _privateConstructorUsedError; // profile
  ProfileModel get profile => throw _privateConstructorUsedError; // operator
  NetworkOperator get operator => throw _privateConstructorUsedError; // sim
  SimModel get sim => throw _privateConstructorUsedError; // requestedSimId
  String get rsid => throw _privateConstructorUsedError; //
// meta..
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterTaskModelCopyWith<RegisterTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterTaskModelCopyWith<$Res> {
  factory $RegisterTaskModelCopyWith(
          RegisterTaskModel value, $Res Function(RegisterTaskModel) then) =
      _$RegisterTaskModelCopyWithImpl<$Res, RegisterTaskModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      RegisterTaskStatus status,
      ProfileModel profile,
      NetworkOperator operator,
      SimModel sim,
      String rsid,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  $ProfileModelCopyWith<$Res> get profile;
  $SimModelCopyWith<$Res> get sim;
}

/// @nodoc
class _$RegisterTaskModelCopyWithImpl<$Res, $Val extends RegisterTaskModel>
    implements $RegisterTaskModelCopyWith<$Res> {
  _$RegisterTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? profile = null,
    Object? operator = null,
    Object? sim = null,
    Object? rsid = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterTaskStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as NetworkOperator,
      sim: null == sim
          ? _value.sim
          : sim // ignore: cast_nullable_to_non_nullable
              as SimModel,
      rsid: null == rsid
          ? _value.rsid
          : rsid // ignore: cast_nullable_to_non_nullable
              as String,
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
  $SimModelCopyWith<$Res> get sim {
    return $SimModelCopyWith<$Res>(_value.sim, (value) {
      return _then(_value.copyWith(sim: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterTaskModelImplCopyWith<$Res>
    implements $RegisterTaskModelCopyWith<$Res> {
  factory _$$RegisterTaskModelImplCopyWith(_$RegisterTaskModelImpl value,
          $Res Function(_$RegisterTaskModelImpl) then) =
      __$$RegisterTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      RegisterTaskStatus status,
      ProfileModel profile,
      NetworkOperator operator,
      SimModel sim,
      String rsid,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $ProfileModelCopyWith<$Res> get profile;
  @override
  $SimModelCopyWith<$Res> get sim;
}

/// @nodoc
class __$$RegisterTaskModelImplCopyWithImpl<$Res>
    extends _$RegisterTaskModelCopyWithImpl<$Res, _$RegisterTaskModelImpl>
    implements _$$RegisterTaskModelImplCopyWith<$Res> {
  __$$RegisterTaskModelImplCopyWithImpl(_$RegisterTaskModelImpl _value,
      $Res Function(_$RegisterTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? profile = null,
    Object? operator = null,
    Object? sim = null,
    Object? rsid = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$RegisterTaskModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterTaskStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as NetworkOperator,
      sim: null == sim
          ? _value.sim
          : sim // ignore: cast_nullable_to_non_nullable
              as SimModel,
      rsid: null == rsid
          ? _value.rsid
          : rsid // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$RegisterTaskModelImpl implements _RegisterTaskModel {
  _$RegisterTaskModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.status,
      required this.profile,
      required this.operator,
      required this.sim,
      required this.rsid,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _metadata = metadata;

  factory _$RegisterTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterTaskModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
// status
  @override
  final RegisterTaskStatus status;
// profile
  @override
  final ProfileModel profile;
// operator
  @override
  final NetworkOperator operator;
// sim
  @override
  final SimModel sim;
// requestedSimId
  @override
  final String rsid;
//
// meta..
  final Map<String, dynamic> _metadata;
//
// meta..
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
  @NullableTimestampDateTimeSerializer()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'RegisterTaskModel(ref: $ref, status: $status, profile: $profile, operator: $operator, sim: $sim, rsid: $rsid, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterTaskModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.sim, sim) || other.sim == sim) &&
            (identical(other.rsid, rsid) || other.rsid == rsid) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      ref,
      status,
      profile,
      operator,
      sim,
      rsid,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterTaskModelImplCopyWith<_$RegisterTaskModelImpl> get copyWith =>
      __$$RegisterTaskModelImplCopyWithImpl<_$RegisterTaskModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterTaskModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterTaskModel implements RegisterTaskModel {
  factory _RegisterTaskModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final RegisterTaskStatus status,
          required final ProfileModel profile,
          required final NetworkOperator operator,
          required final SimModel sim,
          required final String rsid,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$RegisterTaskModelImpl;

  factory _RegisterTaskModel.fromJson(Map<String, dynamic> json) =
      _$RegisterTaskModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override // status
  RegisterTaskStatus get status;
  @override // profile
  ProfileModel get profile;
  @override // operator
  NetworkOperator get operator;
  @override // sim
  SimModel get sim;
  @override // requestedSimId
  String get rsid;
  @override //
// meta..
  Map<String, dynamic> get metadata;
  @override
  @TimestampDateTimeSerializer()
  DateTime get createdAt;
  @override
  @TimestampDateTimeSerializer()
  DateTime get updatedAt;
  @override
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$RegisterTaskModelImplCopyWith<_$RegisterTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
