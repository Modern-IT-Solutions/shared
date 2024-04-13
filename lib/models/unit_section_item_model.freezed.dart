// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_section_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitSectionItemModel _$UnitSectionItemModelFromJson(Map<String, dynamic> json) {
  return _UnitSectionItemModel.fromJson(json);
}

/// @nodoc
mixin _$UnitSectionItemModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  UnitSectionItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  bool get isFree => throw _privateConstructorUsedError; // doc and lev (meet)
  String get url => throw _privateConstructorUsedError; // live
  String get hash => throw _privateConstructorUsedError;
  String? get poster => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;
  bool get useYoutubePlayer => throw _privateConstructorUsedError; // live-end
  ModelVisibility get visibility => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitSectionItemModelCopyWith<UnitSectionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitSectionItemModelCopyWith<$Res> {
  factory $UnitSectionItemModelCopyWith(UnitSectionItemModel value,
          $Res Function(UnitSectionItemModel) then) =
      _$UnitSectionItemModelCopyWithImpl<$Res, UnitSectionItemModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      UnitSectionItemType type,
      String title,
      String? description,
      int order,
      bool isFree,
      String url,
      String hash,
      String? poster,
      bool isLive,
      bool useYoutubePlayer,
      ModelVisibility visibility,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class _$UnitSectionItemModelCopyWithImpl<$Res,
        $Val extends UnitSectionItemModel>
    implements $UnitSectionItemModelCopyWith<$Res> {
  _$UnitSectionItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? order = null,
    Object? isFree = null,
    Object? url = null,
    Object? hash = null,
    Object? poster = freezed,
    Object? isLive = null,
    Object? useYoutubePlayer = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UnitSectionItemType,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      useYoutubePlayer: null == useYoutubePlayer
          ? _value.useYoutubePlayer
          : useYoutubePlayer // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UnitSectionItemModelImplCopyWith<$Res>
    implements $UnitSectionItemModelCopyWith<$Res> {
  factory _$$UnitSectionItemModelImplCopyWith(_$UnitSectionItemModelImpl value,
          $Res Function(_$UnitSectionItemModelImpl) then) =
      __$$UnitSectionItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      UnitSectionItemType type,
      String title,
      String? description,
      int order,
      bool isFree,
      String url,
      String hash,
      String? poster,
      bool isLive,
      bool useYoutubePlayer,
      ModelVisibility visibility,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class __$$UnitSectionItemModelImplCopyWithImpl<$Res>
    extends _$UnitSectionItemModelCopyWithImpl<$Res, _$UnitSectionItemModelImpl>
    implements _$$UnitSectionItemModelImplCopyWith<$Res> {
  __$$UnitSectionItemModelImplCopyWithImpl(_$UnitSectionItemModelImpl _value,
      $Res Function(_$UnitSectionItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? order = null,
    Object? isFree = null,
    Object? url = null,
    Object? hash = null,
    Object? poster = freezed,
    Object? isLive = null,
    Object? useYoutubePlayer = null,
    Object? visibility = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$UnitSectionItemModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UnitSectionItemType,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      useYoutubePlayer: null == useYoutubePlayer
          ? _value.useYoutubePlayer
          : useYoutubePlayer // ignore: cast_nullable_to_non_nullable
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
class _$UnitSectionItemModelImpl implements _UnitSectionItemModel {
  _$UnitSectionItemModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.type,
      required this.title,
      this.description,
      required this.order,
      this.isFree = false,
      this.url = "",
      this.hash = "",
      this.poster,
      this.isLive = false,
      this.useYoutubePlayer = false,
      this.visibility = ModelVisibility.visible,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt});

  factory _$UnitSectionItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitSectionItemModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final UnitSectionItemType type;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int order;
  @override
  @JsonKey()
  final bool isFree;
// doc and lev (meet)
  @override
  @JsonKey()
  final String url;
// live
  @override
  @JsonKey()
  final String hash;
  @override
  final String? poster;
  @override
  @JsonKey()
  final bool isLive;
  @override
  @JsonKey()
  final bool useYoutubePlayer;
// live-end
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
    return 'UnitSectionItemModel(ref: $ref, type: $type, title: $title, description: $description, order: $order, isFree: $isFree, url: $url, hash: $hash, poster: $poster, isLive: $isLive, useYoutubePlayer: $useYoutubePlayer, visibility: $visibility, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitSectionItemModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.useYoutubePlayer, useYoutubePlayer) ||
                other.useYoutubePlayer == useYoutubePlayer) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      ref,
      type,
      title,
      description,
      order,
      isFree,
      url,
      hash,
      poster,
      isLive,
      useYoutubePlayer,
      visibility,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitSectionItemModelImplCopyWith<_$UnitSectionItemModelImpl>
      get copyWith =>
          __$$UnitSectionItemModelImplCopyWithImpl<_$UnitSectionItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitSectionItemModelImplToJson(
      this,
    );
  }
}

abstract class _UnitSectionItemModel implements UnitSectionItemModel {
  factory _UnitSectionItemModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final UnitSectionItemType type,
          required final String title,
          final String? description,
          required final int order,
          final bool isFree,
          final String url,
          final String hash,
          final String? poster,
          final bool isLive,
          final bool useYoutubePlayer,
          final ModelVisibility visibility,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$UnitSectionItemModelImpl;

  factory _UnitSectionItemModel.fromJson(Map<String, dynamic> json) =
      _$UnitSectionItemModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  UnitSectionItemType get type;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get order;
  @override
  bool get isFree;
  @override // doc and lev (meet)
  String get url;
  @override // live
  String get hash;
  @override
  String? get poster;
  @override
  bool get isLive;
  @override
  bool get useYoutubePlayer;
  @override // live-end
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
  _$$UnitSectionItemModelImplCopyWith<_$UnitSectionItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
