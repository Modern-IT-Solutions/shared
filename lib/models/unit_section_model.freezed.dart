// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_section_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitSectionModel _$UnitSectionModelFromJson(Map<String, dynamic> json) {
  return _UnitSectionModel.fromJson(json);
}

/// @nodoc
mixin _$UnitSectionModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isFree => throw _privateConstructorUsedError;
  ModelVisibility get visibility => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitSectionModelCopyWith<UnitSectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitSectionModelCopyWith<$Res> {
  factory $UnitSectionModelCopyWith(
          UnitSectionModel value, $Res Function(UnitSectionModel) then) =
      _$UnitSectionModelCopyWithImpl<$Res, UnitSectionModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String title,
      String? description,
      int order,
      bool isFree,
      ModelVisibility visibility,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class _$UnitSectionModelCopyWithImpl<$Res, $Val extends UnitSectionModel>
    implements $UnitSectionModelCopyWith<$Res> {
  _$UnitSectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? title = null,
    Object? description = freezed,
    Object? order = null,
    Object? isFree = null,
    Object? visibility = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ModelVisibility,
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
abstract class _$$UnitSectionModelImplCopyWith<$Res>
    implements $UnitSectionModelCopyWith<$Res> {
  factory _$$UnitSectionModelImplCopyWith(_$UnitSectionModelImpl value,
          $Res Function(_$UnitSectionModelImpl) then) =
      __$$UnitSectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String title,
      String? description,
      int order,
      bool isFree,
      ModelVisibility visibility,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class __$$UnitSectionModelImplCopyWithImpl<$Res>
    extends _$UnitSectionModelCopyWithImpl<$Res, _$UnitSectionModelImpl>
    implements _$$UnitSectionModelImplCopyWith<$Res> {
  __$$UnitSectionModelImplCopyWithImpl(_$UnitSectionModelImpl _value,
      $Res Function(_$UnitSectionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? title = null,
    Object? description = freezed,
    Object? order = null,
    Object? isFree = null,
    Object? visibility = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$UnitSectionModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ModelVisibility,
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
class _$UnitSectionModelImpl implements _UnitSectionModel {
  _$UnitSectionModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.title,
      this.description,
      required this.order,
      this.isFree = false,
      this.visibility = ModelVisibility.visible,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt});

  factory _$UnitSectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitSectionModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int order;
  @override
  @JsonKey()
  final bool isFree;
  @override
  @JsonKey()
  final ModelVisibility visibility;
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
    return 'UnitSectionModel(ref: $ref, title: $title, description: $description, order: $order, isFree: $isFree, visibility: $visibility, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitSectionModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ref, title, description, order,
      isFree, visibility, createdAt, updatedAt, deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitSectionModelImplCopyWith<_$UnitSectionModelImpl> get copyWith =>
      __$$UnitSectionModelImplCopyWithImpl<_$UnitSectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitSectionModelImplToJson(
      this,
    );
  }
}

abstract class _UnitSectionModel implements UnitSectionModel {
  factory _UnitSectionModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final String title,
          final String? description,
          required final int order,
          final bool isFree,
          final ModelVisibility visibility,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$UnitSectionModelImpl;

  factory _UnitSectionModel.fromJson(Map<String, dynamic> json) =
      _$UnitSectionModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get order;
  @override
  bool get isFree;
  @override
  ModelVisibility get visibility;
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
  _$$UnitSectionModelImplCopyWith<_$UnitSectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
