// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistance_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssistanceFeedback _$AssistanceFeedbackFromJson(Map<String, dynamic> json) {
  return _AssistanceFeedback.fromJson(json);
}

/// @nodoc
mixin _$AssistanceFeedback {
  String? get note => throw _privateConstructorUsedError; // rate
  double get rate => throw _privateConstructorUsedError; // created by
  ProfileModel get profile => throw _privateConstructorUsedError; // metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssistanceFeedbackCopyWith<AssistanceFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistanceFeedbackCopyWith<$Res> {
  factory $AssistanceFeedbackCopyWith(
          AssistanceFeedback value, $Res Function(AssistanceFeedback) then) =
      _$AssistanceFeedbackCopyWithImpl<$Res, AssistanceFeedback>;
  @useResult
  $Res call(
      {String? note,
      double rate,
      ProfileModel profile,
      Map<String, dynamic> metadata});

  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$AssistanceFeedbackCopyWithImpl<$Res, $Val extends AssistanceFeedback>
    implements $AssistanceFeedbackCopyWith<$Res> {
  _$AssistanceFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? rate = null,
    Object? profile = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
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
abstract class _$$AssistanceFeedbackImplCopyWith<$Res>
    implements $AssistanceFeedbackCopyWith<$Res> {
  factory _$$AssistanceFeedbackImplCopyWith(_$AssistanceFeedbackImpl value,
          $Res Function(_$AssistanceFeedbackImpl) then) =
      __$$AssistanceFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? note,
      double rate,
      ProfileModel profile,
      Map<String, dynamic> metadata});

  @override
  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$AssistanceFeedbackImplCopyWithImpl<$Res>
    extends _$AssistanceFeedbackCopyWithImpl<$Res, _$AssistanceFeedbackImpl>
    implements _$$AssistanceFeedbackImplCopyWith<$Res> {
  __$$AssistanceFeedbackImplCopyWithImpl(_$AssistanceFeedbackImpl _value,
      $Res Function(_$AssistanceFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? rate = null,
    Object? profile = null,
    Object? metadata = null,
  }) {
    return _then(_$AssistanceFeedbackImpl(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssistanceFeedbackImpl implements _AssistanceFeedback {
  _$AssistanceFeedbackImpl(
      {this.note,
      required this.rate,
      required this.profile,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$AssistanceFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssistanceFeedbackImplFromJson(json);

  @override
  final String? note;
// rate
  @override
  final double rate;
// created by
  @override
  final ProfileModel profile;
// metadata
  final Map<String, dynamic> _metadata;
// metadata
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'AssistanceFeedback(note: $note, rate: $rate, profile: $profile, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistanceFeedbackImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, note, rate, profile,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistanceFeedbackImplCopyWith<_$AssistanceFeedbackImpl> get copyWith =>
      __$$AssistanceFeedbackImplCopyWithImpl<_$AssistanceFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssistanceFeedbackImplToJson(
      this,
    );
  }
}

abstract class _AssistanceFeedback implements AssistanceFeedback {
  factory _AssistanceFeedback(
      {final String? note,
      required final double rate,
      required final ProfileModel profile,
      final Map<String, dynamic> metadata}) = _$AssistanceFeedbackImpl;

  factory _AssistanceFeedback.fromJson(Map<String, dynamic> json) =
      _$AssistanceFeedbackImpl.fromJson;

  @override
  String? get note;
  @override // rate
  double get rate;
  @override // created by
  ProfileModel get profile;
  @override // metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AssistanceFeedbackImplCopyWith<_$AssistanceFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
