// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_subject_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitSubjectModel _$UnitSubjectModelFromJson(Map<String, dynamic> json) {
  return _UnitSubjectModel.fromJson(json);
}

/// @nodoc
mixin _$UnitSubjectModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitSubjectModelCopyWith<UnitSubjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitSubjectModelCopyWith<$Res> {
  factory $UnitSubjectModelCopyWith(
          UnitSubjectModel value, $Res Function(UnitSubjectModel) then) =
      _$UnitSubjectModelCopyWithImpl<$Res, UnitSubjectModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class _$UnitSubjectModelCopyWithImpl<$Res, $Val extends UnitSubjectModel>
    implements $UnitSubjectModelCopyWith<$Res> {
  _$UnitSubjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
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
}

/// @nodoc
abstract class _$$UnitSubjectModelImplCopyWith<$Res>
    implements $UnitSubjectModelCopyWith<$Res> {
  factory _$$UnitSubjectModelImplCopyWith(_$UnitSubjectModelImpl value,
          $Res Function(_$UnitSubjectModelImpl) then) =
      __$$UnitSubjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class __$$UnitSubjectModelImplCopyWithImpl<$Res>
    extends _$UnitSubjectModelCopyWithImpl<$Res, _$UnitSubjectModelImpl>
    implements _$$UnitSubjectModelImplCopyWith<$Res> {
  __$$UnitSubjectModelImplCopyWithImpl(_$UnitSubjectModelImpl _value,
      $Res Function(_$UnitSubjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$UnitSubjectModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$UnitSubjectModelImpl implements _UnitSubjectModel {
  _$UnitSubjectModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.name,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @TimestampDateTimeSerializer() this.deletedAt});

  factory _$UnitSubjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitSubjectModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final String name;
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
    return 'UnitSubjectModel(ref: $ref, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitSubjectModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ref, name, createdAt, updatedAt, deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitSubjectModelImplCopyWith<_$UnitSubjectModelImpl> get copyWith =>
      __$$UnitSubjectModelImplCopyWithImpl<_$UnitSubjectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitSubjectModelImplToJson(
      this,
    );
  }
}

abstract class _UnitSubjectModel implements UnitSubjectModel {
  factory _UnitSubjectModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final String name,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @TimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$UnitSubjectModelImpl;

  factory _UnitSubjectModel.fromJson(Map<String, dynamic> json) =
      _$UnitSubjectModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  String get name;
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
  _$$UnitSubjectModelImplCopyWith<_$UnitSubjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
