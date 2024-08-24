// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) {
  return _HomeSection.fromJson(json);
}

/// @nodoc
mixin _$HomeSection {
  bool get enabled => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeSectionCopyWith<HomeSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSectionCopyWith<$Res> {
  factory $HomeSectionCopyWith(
          HomeSection value, $Res Function(HomeSection) then) =
      _$HomeSectionCopyWithImpl<$Res, HomeSection>;
  @useResult
  $Res call(
      {bool enabled,
      int order,
      String? subtitle,
      String title,
      List<String> units});
}

/// @nodoc
class _$HomeSectionCopyWithImpl<$Res, $Val extends HomeSection>
    implements $HomeSectionCopyWith<$Res> {
  _$HomeSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? order = null,
    Object? subtitle = freezed,
    Object? title = null,
    Object? units = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeSectionImplCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory _$$HomeSectionImplCopyWith(
          _$HomeSectionImpl value, $Res Function(_$HomeSectionImpl) then) =
      __$$HomeSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enabled,
      int order,
      String? subtitle,
      String title,
      List<String> units});
}

/// @nodoc
class __$$HomeSectionImplCopyWithImpl<$Res>
    extends _$HomeSectionCopyWithImpl<$Res, _$HomeSectionImpl>
    implements _$$HomeSectionImplCopyWith<$Res> {
  __$$HomeSectionImplCopyWithImpl(
      _$HomeSectionImpl _value, $Res Function(_$HomeSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? order = null,
    Object? subtitle = freezed,
    Object? title = null,
    Object? units = null,
  }) {
    return _then(_$HomeSectionImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeSectionImpl implements _HomeSection {
  _$HomeSectionImpl(
      {required this.enabled,
      required this.order,
      this.subtitle,
      required this.title,
      required final List<String> units})
      : _units = units;

  factory _$HomeSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeSectionImplFromJson(json);

  @override
  final bool enabled;
  @override
  final int order;
  @override
  final String? subtitle;
  @override
  final String title;
  final List<String> _units;
  @override
  List<String> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  String toString() {
    return 'HomeSection(enabled: $enabled, order: $order, subtitle: $subtitle, title: $title, units: $units)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSectionImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._units, _units));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, order, subtitle, title,
      const DeepCollectionEquality().hash(_units));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSectionImplCopyWith<_$HomeSectionImpl> get copyWith =>
      __$$HomeSectionImplCopyWithImpl<_$HomeSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeSectionImplToJson(
      this,
    );
  }
}

abstract class _HomeSection implements HomeSection {
  factory _HomeSection(
      {required final bool enabled,
      required final int order,
      final String? subtitle,
      required final String title,
      required final List<String> units}) = _$HomeSectionImpl;

  factory _HomeSection.fromJson(Map<String, dynamic> json) =
      _$HomeSectionImpl.fromJson;

  @override
  bool get enabled;
  @override
  int get order;
  @override
  String? get subtitle;
  @override
  String get title;
  @override
  List<String> get units;
  @override
  @JsonKey(ignore: true)
  _$$HomeSectionImplCopyWith<_$HomeSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
