// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeAd _$HomeAdFromJson(Map<String, dynamic> json) {
  return _HomeAd.fromJson(json);
}

/// @nodoc
mixin _$HomeAd {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  HomeSectionType get type => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeAdCopyWith<HomeAd> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAdCopyWith<$Res> {
  factory $HomeAdCopyWith(HomeAd value, $Res Function(HomeAd) then) =
      _$HomeAdCopyWithImpl<$Res, HomeAd>;
  @useResult
  $Res call(
      {String id,
      String image,
      String link,
      String title,
      String? subtitle,
      HomeSectionType type,
      bool enabled});
}

/// @nodoc
class _$HomeAdCopyWithImpl<$Res, $Val extends HomeAd>
    implements $HomeAdCopyWith<$Res> {
  _$HomeAdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? link = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? type = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeSectionType,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeAdImplCopyWith<$Res> implements $HomeAdCopyWith<$Res> {
  factory _$$HomeAdImplCopyWith(
          _$HomeAdImpl value, $Res Function(_$HomeAdImpl) then) =
      __$$HomeAdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String image,
      String link,
      String title,
      String? subtitle,
      HomeSectionType type,
      bool enabled});
}

/// @nodoc
class __$$HomeAdImplCopyWithImpl<$Res>
    extends _$HomeAdCopyWithImpl<$Res, _$HomeAdImpl>
    implements _$$HomeAdImplCopyWith<$Res> {
  __$$HomeAdImplCopyWithImpl(
      _$HomeAdImpl _value, $Res Function(_$HomeAdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? link = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? type = null,
    Object? enabled = null,
  }) {
    return _then(_$HomeAdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeSectionType,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeAdImpl implements _HomeAd {
  _$HomeAdImpl(
      {required this.id,
      required this.image,
      required this.link,
      required this.title,
      this.subtitle,
      required this.type,
      required this.enabled});

  factory _$HomeAdImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeAdImplFromJson(json);

  @override
  final String id;
  @override
  final String image;
  @override
  final String link;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final HomeSectionType type;
  @override
  final bool enabled;

  @override
  String toString() {
    return 'HomeAd(id: $id, image: $image, link: $link, title: $title, subtitle: $subtitle, type: $type, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, link, title, subtitle, type, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAdImplCopyWith<_$HomeAdImpl> get copyWith =>
      __$$HomeAdImplCopyWithImpl<_$HomeAdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeAdImplToJson(
      this,
    );
  }
}

abstract class _HomeAd implements HomeAd {
  factory _HomeAd(
      {required final String id,
      required final String image,
      required final String link,
      required final String title,
      final String? subtitle,
      required final HomeSectionType type,
      required final bool enabled}) = _$HomeAdImpl;

  factory _HomeAd.fromJson(Map<String, dynamic> json) = _$HomeAdImpl.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  String get link;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  HomeSectionType get type;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$HomeAdImplCopyWith<_$HomeAdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
