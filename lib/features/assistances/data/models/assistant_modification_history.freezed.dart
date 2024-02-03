// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant_modification_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssistantModificationHistory _$AssistantModificationHistoryFromJson(
    Map<String, dynamic> json) {
  return _AssistantModificationHistory.fromJson(json);
}

/// @nodoc
mixin _$AssistantModificationHistory {
  @TimestampDateTimeSerializer()
  DateTime get date => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  ProfileModel get profile => throw _privateConstructorUsedError;
  Map<String, dynamic>? get changes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssistantModificationHistoryCopyWith<AssistantModificationHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistantModificationHistoryCopyWith<$Res> {
  factory $AssistantModificationHistoryCopyWith(
          AssistantModificationHistory value,
          $Res Function(AssistantModificationHistory) then) =
      _$AssistantModificationHistoryCopyWithImpl<$Res,
          AssistantModificationHistory>;
  @useResult
  $Res call(
      {@TimestampDateTimeSerializer() DateTime date,
      String? note,
      ProfileModel profile,
      Map<String, dynamic>? changes,
      String? status,
      Map<String, dynamic> metadata});

  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$AssistantModificationHistoryCopyWithImpl<$Res,
        $Val extends AssistantModificationHistory>
    implements $AssistantModificationHistoryCopyWith<$Res> {
  _$AssistantModificationHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? note = freezed,
    Object? profile = null,
    Object? changes = freezed,
    Object? status = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      changes: freezed == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profile {
    return $ProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssistantModificationHistoryImplCopyWith<$Res>
    implements $AssistantModificationHistoryCopyWith<$Res> {
  factory _$$AssistantModificationHistoryImplCopyWith(
          _$AssistantModificationHistoryImpl value,
          $Res Function(_$AssistantModificationHistoryImpl) then) =
      __$$AssistantModificationHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampDateTimeSerializer() DateTime date,
      String? note,
      ProfileModel profile,
      Map<String, dynamic>? changes,
      String? status,
      Map<String, dynamic> metadata});

  @override
  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$AssistantModificationHistoryImplCopyWithImpl<$Res>
    extends _$AssistantModificationHistoryCopyWithImpl<$Res,
        _$AssistantModificationHistoryImpl>
    implements _$$AssistantModificationHistoryImplCopyWith<$Res> {
  __$$AssistantModificationHistoryImplCopyWithImpl(
      _$AssistantModificationHistoryImpl _value,
      $Res Function(_$AssistantModificationHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? note = freezed,
    Object? profile = null,
    Object? changes = freezed,
    Object? status = freezed,
    Object? metadata = null,
  }) {
    return _then(_$AssistantModificationHistoryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      changes: freezed == changes
          ? _value._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssistantModificationHistoryImpl
    implements _AssistantModificationHistory {
  _$AssistantModificationHistoryImpl(
      {@TimestampDateTimeSerializer() required this.date,
      this.note,
      required this.profile,
      final Map<String, dynamic>? changes,
      this.status,
      final Map<String, dynamic> metadata = const {}})
      : _changes = changes,
        _metadata = metadata;

  factory _$AssistantModificationHistoryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AssistantModificationHistoryImplFromJson(json);

  @override
  @TimestampDateTimeSerializer()
  final DateTime date;
  @override
  final String? note;
  @override
  final ProfileModel profile;
  final Map<String, dynamic>? _changes;
  @override
  Map<String, dynamic>? get changes {
    final value = _changes;
    if (value == null) return null;
    if (_changes is EqualUnmodifiableMapView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? status;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'AssistantModificationHistory(date: $date, note: $note, profile: $profile, changes: $changes, status: $status, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistantModificationHistoryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._changes, _changes) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      note,
      profile,
      const DeepCollectionEquality().hash(_changes),
      status,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistantModificationHistoryImplCopyWith<
          _$AssistantModificationHistoryImpl>
      get copyWith => __$$AssistantModificationHistoryImplCopyWithImpl<
          _$AssistantModificationHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssistantModificationHistoryImplToJson(
      this,
    );
  }
}

abstract class _AssistantModificationHistory
    implements AssistantModificationHistory {
  factory _AssistantModificationHistory(
          {@TimestampDateTimeSerializer() required final DateTime date,
          final String? note,
          required final ProfileModel profile,
          final Map<String, dynamic>? changes,
          final String? status,
          final Map<String, dynamic> metadata}) =
      _$AssistantModificationHistoryImpl;

  factory _AssistantModificationHistory.fromJson(Map<String, dynamic> json) =
      _$AssistantModificationHistoryImpl.fromJson;

  @override
  @TimestampDateTimeSerializer()
  DateTime get date;
  @override
  String? get note;
  @override
  ProfileModel get profile;
  @override
  Map<String, dynamic>? get changes;
  @override
  String? get status;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AssistantModificationHistoryImplCopyWith<
          _$AssistantModificationHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
