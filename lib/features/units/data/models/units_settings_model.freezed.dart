// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'units_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitsSettingsModel _$UnitsSettingsModelFromJson(Map<String, dynamic> json) {
  return _UnitsSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UnitsSettingsModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// option model field
  List<String> get subjects => throw _privateConstructorUsedError;
  List<String> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitsSettingsModelCopyWith<UnitsSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitsSettingsModelCopyWith<$Res> {
  factory $UnitsSettingsModelCopyWith(
          UnitsSettingsModel value, $Res Function(UnitsSettingsModel) then) =
      _$UnitsSettingsModelCopyWithImpl<$Res, UnitsSettingsModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
      List<String> subjects,
      List<String> fields});
}

/// @nodoc
class _$UnitsSettingsModelCopyWithImpl<$Res, $Val extends UnitsSettingsModel>
    implements $UnitsSettingsModelCopyWith<$Res> {
  _$UnitsSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? subjects = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
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
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitsSettingsModelImplCopyWith<$Res>
    implements $UnitsSettingsModelCopyWith<$Res> {
  factory _$$UnitsSettingsModelImplCopyWith(_$UnitsSettingsModelImpl value,
          $Res Function(_$UnitsSettingsModelImpl) then) =
      __$$UnitsSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
      List<String> subjects,
      List<String> fields});
}

/// @nodoc
class __$$UnitsSettingsModelImplCopyWithImpl<$Res>
    extends _$UnitsSettingsModelCopyWithImpl<$Res, _$UnitsSettingsModelImpl>
    implements _$$UnitsSettingsModelImplCopyWith<$Res> {
  __$$UnitsSettingsModelImplCopyWithImpl(_$UnitsSettingsModelImpl _value,
      $Res Function(_$UnitsSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? subjects = null,
    Object? fields = null,
  }) {
    return _then(_$UnitsSettingsModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
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
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitsSettingsModelImpl implements _UnitsSettingsModel {
  const _$UnitsSettingsModelImpl(
      {@ModelRefSerializer() required this.ref,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt,
      final List<String> subjects = const [],
      final List<String> fields = const []})
      : _subjects = subjects,
        _fields = fields;

  factory _$UnitsSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitsSettingsModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  @TimestampDateTimeSerializer()
  final DateTime createdAt;
  @override
  @TimestampDateTimeSerializer()
  final DateTime updatedAt;
  @override
  @NullableTimestampDateTimeSerializer()
  final DateTime? deletedAt;

  /// option model field
  final List<String> _subjects;

  /// option model field
  @override
  @JsonKey()
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  final List<String> _fields;
  @override
  @JsonKey()
  List<String> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'UnitsSettingsModel(ref: $ref, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, subjects: $subjects, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitsSettingsModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ref,
      createdAt,
      updatedAt,
      deletedAt,
      const DeepCollectionEquality().hash(_subjects),
      const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitsSettingsModelImplCopyWith<_$UnitsSettingsModelImpl> get copyWith =>
      __$$UnitsSettingsModelImplCopyWithImpl<_$UnitsSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitsSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UnitsSettingsModel implements UnitsSettingsModel {
  const factory _UnitsSettingsModel(
      {@ModelRefSerializer() required final ModelRef ref,
      @TimestampDateTimeSerializer() required final DateTime createdAt,
      @TimestampDateTimeSerializer() required final DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() final DateTime? deletedAt,
      final List<String> subjects,
      final List<String> fields}) = _$UnitsSettingsModelImpl;

  factory _UnitsSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UnitsSettingsModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
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

  /// option model field
  List<String> get subjects;
  @override
  List<String> get fields;
  @override
  @JsonKey(ignore: true)
  _$$UnitsSettingsModelImplCopyWith<_$UnitsSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
