// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventPreference _$EventPreferenceFromJson(Map<String, dynamic> json) {
  return _EventPreference.fromJson(json);
}

/// @nodoc
mixin _$EventPreference {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  EventType get type => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get date => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventPreferenceCopyWith<EventPreference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPreferenceCopyWith<$Res> {
  factory $EventPreferenceCopyWith(
          EventPreference value, $Res Function(EventPreference) then) =
      _$EventPreferenceCopyWithImpl<$Res, EventPreference>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      EventType type,
      String? action,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime date,
      @TimestampDateTimeSerializer() DateTime createdAt});
}

/// @nodoc
class _$EventPreferenceCopyWithImpl<$Res, $Val extends EventPreference>
    implements $EventPreferenceCopyWith<$Res> {
  _$EventPreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? type = null,
    Object? action = freezed,
    Object? metadata = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventPreferenceImplCopyWith<$Res>
    implements $EventPreferenceCopyWith<$Res> {
  factory _$$EventPreferenceImplCopyWith(_$EventPreferenceImpl value,
          $Res Function(_$EventPreferenceImpl) then) =
      __$$EventPreferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      EventType type,
      String? action,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime date,
      @TimestampDateTimeSerializer() DateTime createdAt});
}

/// @nodoc
class __$$EventPreferenceImplCopyWithImpl<$Res>
    extends _$EventPreferenceCopyWithImpl<$Res, _$EventPreferenceImpl>
    implements _$$EventPreferenceImplCopyWith<$Res> {
  __$$EventPreferenceImplCopyWithImpl(
      _$EventPreferenceImpl _value, $Res Function(_$EventPreferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? type = null,
    Object? action = freezed,
    Object? metadata = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$EventPreferenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventPreferenceImpl implements _EventPreference {
  _$EventPreferenceImpl(
      {required this.id,
      required this.title,
      this.description,
      this.type = EventType.info,
      this.action,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.date,
      @TimestampDateTimeSerializer() required this.createdAt})
      : _metadata = metadata;

  factory _$EventPreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventPreferenceImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final EventType type;
  @override
  final String? action;
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
  final DateTime date;
  @override
  @TimestampDateTimeSerializer()
  final DateTime createdAt;

  @override
  String toString() {
    return 'EventPreference(id: $id, title: $title, description: $description, type: $type, action: $action, metadata: $metadata, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventPreferenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      action, const DeepCollectionEquality().hash(_metadata), date, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventPreferenceImplCopyWith<_$EventPreferenceImpl> get copyWith =>
      __$$EventPreferenceImplCopyWithImpl<_$EventPreferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventPreferenceImplToJson(
      this,
    );
  }
}

abstract class _EventPreference implements EventPreference {
  factory _EventPreference(
          {required final String id,
          required final String title,
          final String? description,
          final EventType type,
          final String? action,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime date,
          @TimestampDateTimeSerializer() required final DateTime createdAt}) =
      _$EventPreferenceImpl;

  factory _EventPreference.fromJson(Map<String, dynamic> json) =
      _$EventPreferenceImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  EventType get type;
  @override
  String? get action;
  @override
  Map<String, dynamic> get metadata;
  @override
  @TimestampDateTimeSerializer()
  DateTime get date;
  @override
  @TimestampDateTimeSerializer()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$EventPreferenceImplCopyWith<_$EventPreferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
