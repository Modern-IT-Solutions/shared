// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sim_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimTaskModel _$SimTaskModelFromJson(Map<String, dynamic> json) {
  return _SimTaskModel.fromJson(json);
}

/// @nodoc
mixin _$SimTaskModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError; // name
  SimTaskStatus get status => throw _privateConstructorUsedError; // code
  String get code => throw _privateConstructorUsedError; // runner
  SimModel? get runner => throw _privateConstructorUsedError; // type
  SimTaskType get type => throw _privateConstructorUsedError; // meta..
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimTaskModelCopyWith<SimTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimTaskModelCopyWith<$Res> {
  factory $SimTaskModelCopyWith(
          SimTaskModel value, $Res Function(SimTaskModel) then) =
      _$SimTaskModelCopyWithImpl<$Res, SimTaskModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      SimTaskStatus status,
      String code,
      SimModel? runner,
      SimTaskType type,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  $SimModelCopyWith<$Res>? get runner;
}

/// @nodoc
class _$SimTaskModelCopyWithImpl<$Res, $Val extends SimTaskModel>
    implements $SimTaskModelCopyWith<$Res> {
  _$SimTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? code = null,
    Object? runner = freezed,
    Object? type = null,
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
              as SimTaskStatus,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      runner: freezed == runner
          ? _value.runner
          : runner // ignore: cast_nullable_to_non_nullable
              as SimModel?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SimTaskType,
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
  $SimModelCopyWith<$Res>? get runner {
    if (_value.runner == null) {
      return null;
    }

    return $SimModelCopyWith<$Res>(_value.runner!, (value) {
      return _then(_value.copyWith(runner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimTaskModelImplCopyWith<$Res>
    implements $SimTaskModelCopyWith<$Res> {
  factory _$$SimTaskModelImplCopyWith(
          _$SimTaskModelImpl value, $Res Function(_$SimTaskModelImpl) then) =
      __$$SimTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      SimTaskStatus status,
      String code,
      SimModel? runner,
      SimTaskType type,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $SimModelCopyWith<$Res>? get runner;
}

/// @nodoc
class __$$SimTaskModelImplCopyWithImpl<$Res>
    extends _$SimTaskModelCopyWithImpl<$Res, _$SimTaskModelImpl>
    implements _$$SimTaskModelImplCopyWith<$Res> {
  __$$SimTaskModelImplCopyWithImpl(
      _$SimTaskModelImpl _value, $Res Function(_$SimTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? code = null,
    Object? runner = freezed,
    Object? type = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$SimTaskModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimTaskStatus,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      runner: freezed == runner
          ? _value.runner
          : runner // ignore: cast_nullable_to_non_nullable
              as SimModel?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SimTaskType,
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
class _$SimTaskModelImpl implements _SimTaskModel {
  _$SimTaskModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.status,
      required this.code,
      this.runner,
      required this.type,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _metadata = metadata;

  factory _$SimTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimTaskModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
// name
  @override
  final SimTaskStatus status;
// code
  @override
  final String code;
// runner
  @override
  final SimModel? runner;
// type
  @override
  final SimTaskType type;
// meta..
  final Map<String, dynamic> _metadata;
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
    return 'SimTaskModel(ref: $ref, status: $status, code: $code, runner: $runner, type: $type, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimTaskModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.runner, runner) || other.runner == runner) &&
            (identical(other.type, type) || other.type == type) &&
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
      code,
      runner,
      type,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimTaskModelImplCopyWith<_$SimTaskModelImpl> get copyWith =>
      __$$SimTaskModelImplCopyWithImpl<_$SimTaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimTaskModelImplToJson(
      this,
    );
  }
}

abstract class _SimTaskModel implements SimTaskModel {
  factory _SimTaskModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final SimTaskStatus status,
          required final String code,
          final SimModel? runner,
          required final SimTaskType type,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$SimTaskModelImpl;

  factory _SimTaskModel.fromJson(Map<String, dynamic> json) =
      _$SimTaskModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override // name
  SimTaskStatus get status;
  @override // code
  String get code;
  @override // runner
  SimModel? get runner;
  @override // type
  SimTaskType get type;
  @override // meta..
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
  _$$SimTaskModelImplCopyWith<_$SimTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
