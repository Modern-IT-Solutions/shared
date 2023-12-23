// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderItem _$SliderItemFromJson(Map<String, dynamic> json) {
  return _SliderItem.fromJson(json);
}

/// @nodoc
mixin _$SliderItem {
  SliderItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderItemCopyWith<SliderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderItemCopyWith<$Res> {
  factory $SliderItemCopyWith(
          SliderItem value, $Res Function(SliderItem) then) =
      _$SliderItemCopyWithImpl<$Res, SliderItem>;
  @useResult
  $Res call(
      {SliderItemType type,
      String title,
      String? description,
      String src,
      String? action});
}

/// @nodoc
class _$SliderItemCopyWithImpl<$Res, $Val extends SliderItem>
    implements $SliderItemCopyWith<$Res> {
  _$SliderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? src = null,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SliderItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderItemImplCopyWith<$Res>
    implements $SliderItemCopyWith<$Res> {
  factory _$$SliderItemImplCopyWith(
          _$SliderItemImpl value, $Res Function(_$SliderItemImpl) then) =
      __$$SliderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SliderItemType type,
      String title,
      String? description,
      String src,
      String? action});
}

/// @nodoc
class __$$SliderItemImplCopyWithImpl<$Res>
    extends _$SliderItemCopyWithImpl<$Res, _$SliderItemImpl>
    implements _$$SliderItemImplCopyWith<$Res> {
  __$$SliderItemImplCopyWithImpl(
      _$SliderItemImpl _value, $Res Function(_$SliderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? src = null,
    Object? action = freezed,
  }) {
    return _then(_$SliderItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SliderItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderItemImpl implements _SliderItem {
  _$SliderItemImpl(
      {required this.type,
      required this.title,
      this.description,
      required this.src,
      this.action});

  factory _$SliderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderItemImplFromJson(json);

  @override
  final SliderItemType type;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String src;
  @override
  final String? action;

  @override
  String toString() {
    return 'SliderItem(type: $type, title: $title, description: $description, src: $src, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, title, description, src, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderItemImplCopyWith<_$SliderItemImpl> get copyWith =>
      __$$SliderItemImplCopyWithImpl<_$SliderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderItemImplToJson(
      this,
    );
  }
}

abstract class _SliderItem implements SliderItem {
  factory _SliderItem(
      {required final SliderItemType type,
      required final String title,
      final String? description,
      required final String src,
      final String? action}) = _$SliderItemImpl;

  factory _SliderItem.fromJson(Map<String, dynamic> json) =
      _$SliderItemImpl.fromJson;

  @override
  SliderItemType get type;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get src;
  @override
  String? get action;
  @override
  @JsonKey(ignore: true)
  _$$SliderItemImplCopyWith<_$SliderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
