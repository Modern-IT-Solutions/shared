// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiftCardModel _$GiftCardModelFromJson(Map<String, dynamic> json) {
  return _GiftCardModel.fromJson(json);
}

/// @nodoc
mixin _$GiftCardModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  ProfileModel? get owner => throw _privateConstructorUsedError;

  ///
  /// Gift Card info
  String get code => throw _privateConstructorUsedError; // expiration date
  @NullableTimestampDateTimeSerializer()
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  TransactionModel? get transaction =>
      throw _privateConstructorUsedError; // freezed
  bool get freezed =>
      throw _privateConstructorUsedError; // next intervention date
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftCardModelCopyWith<GiftCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardModelCopyWith<$Res> {
  factory $GiftCardModelCopyWith(
          GiftCardModel value, $Res Function(GiftCardModel) then) =
      _$GiftCardModelCopyWithImpl<$Res, GiftCardModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      ProfileModel? owner,
      String code,
      @NullableTimestampDateTimeSerializer() DateTime? expiresAt,
      double amount,
      String currency,
      TransactionModel? transaction,
      bool freezed,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  $ProfileModelCopyWith<$Res>? get owner;
  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$GiftCardModelCopyWithImpl<$Res, $Val extends GiftCardModel>
    implements $GiftCardModelCopyWith<$Res> {
  _$GiftCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? owner = freezed,
    Object? code = null,
    Object? expiresAt = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? transaction = freezed,
    Object? freezed = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
      freezed: null == freezed
          ? _value.freezed
          : freezed // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionModelCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionModelCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiftCardModelImplCopyWith<$Res>
    implements $GiftCardModelCopyWith<$Res> {
  factory _$$GiftCardModelImplCopyWith(
          _$GiftCardModelImpl value, $Res Function(_$GiftCardModelImpl) then) =
      __$$GiftCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      ProfileModel? owner,
      String code,
      @NullableTimestampDateTimeSerializer() DateTime? expiresAt,
      double amount,
      String currency,
      TransactionModel? transaction,
      bool freezed,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $ProfileModelCopyWith<$Res>? get owner;
  @override
  $TransactionModelCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$GiftCardModelImplCopyWithImpl<$Res>
    extends _$GiftCardModelCopyWithImpl<$Res, _$GiftCardModelImpl>
    implements _$$GiftCardModelImplCopyWith<$Res> {
  __$$GiftCardModelImplCopyWithImpl(
      _$GiftCardModelImpl _value, $Res Function(_$GiftCardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? owner = freezed,
    Object? code = null,
    Object? expiresAt = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? transaction = freezed,
    Object? freezed = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$GiftCardModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
      freezed: null == freezed
          ? _value.freezed
          : freezed // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
class _$GiftCardModelImpl implements _GiftCardModel {
  _$GiftCardModelImpl(
      {@ModelRefSerializer() required this.ref,
      this.owner,
      required this.code,
      @NullableTimestampDateTimeSerializer() this.expiresAt,
      required this.amount,
      required this.currency,
      this.transaction,
      this.freezed = false,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _metadata = metadata;

  factory _$GiftCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final ProfileModel? owner;

  ///
  /// Gift Card info
  @override
  final String code;
// expiration date
  @override
  @NullableTimestampDateTimeSerializer()
  final DateTime? expiresAt;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final TransactionModel? transaction;
// freezed
  @override
  @JsonKey()
  final bool freezed;
// next intervention date
  final Map<String, dynamic> _metadata;
// next intervention date
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

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
    return 'GiftCardModel(ref: $ref, owner: $owner, code: $code, expiresAt: $expiresAt, amount: $amount, currency: $currency, transaction: $transaction, freezed: $freezed, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.freezed, freezed) || other.freezed == freezed) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
      owner,
      code,
      expiresAt,
      amount,
      currency,
      transaction,
      freezed,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardModelImplCopyWith<_$GiftCardModelImpl> get copyWith =>
      __$$GiftCardModelImplCopyWithImpl<_$GiftCardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardModelImplToJson(
      this,
    );
  }
}

abstract class _GiftCardModel implements GiftCardModel {
  factory _GiftCardModel(
          {@ModelRefSerializer() required final ModelRef ref,
          final ProfileModel? owner,
          required final String code,
          @NullableTimestampDateTimeSerializer() final DateTime? expiresAt,
          required final double amount,
          required final String currency,
          final TransactionModel? transaction,
          final bool freezed,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$GiftCardModelImpl;

  factory _GiftCardModel.fromJson(Map<String, dynamic> json) =
      _$GiftCardModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  ProfileModel? get owner;
  @override

  ///
  /// Gift Card info
  String get code;
  @override // expiration date
  @NullableTimestampDateTimeSerializer()
  DateTime? get expiresAt;
  @override
  double get amount;
  @override
  String get currency;
  @override
  TransactionModel? get transaction;
  @override // freezed
  bool get freezed;
  @override // next intervention date
  Map<String, dynamic> get metadata;
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
  _$$GiftCardModelImplCopyWith<_$GiftCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
