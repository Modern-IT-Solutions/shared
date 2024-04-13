// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sim_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimModel _$SimModelFromJson(Map<String, dynamic> json) {
  return _SimModel.fromJson(json);
}

/// @nodoc
mixin _$SimModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError; // name
  String get name => throw _privateConstructorUsedError; // phone number
  String get phoneNumber => throw _privateConstructorUsedError; // operator
  NetworkOperator get operator =>
      throw _privateConstructorUsedError; // pin code
  String? get pinCode => throw _privateConstructorUsedError; // balance
  double get balance => throw _privateConstructorUsedError; // bonusBalance
  double get bonusBalance => throw _privateConstructorUsedError; // status
  SimStatus get status =>
      throw _privateConstructorUsedError; // lastBalanceFetchAt
  double get lastBalanceFetchAt =>
      throw _privateConstructorUsedError; // lastBonusBalanceFetchAt
  double get lastBonusBalanceFetchAt =>
      throw _privateConstructorUsedError; // meta..
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimModelCopyWith<SimModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimModelCopyWith<$Res> {
  factory $SimModelCopyWith(SimModel value, $Res Function(SimModel) then) =
      _$SimModelCopyWithImpl<$Res, SimModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      String phoneNumber,
      NetworkOperator operator,
      String? pinCode,
      double balance,
      double bonusBalance,
      SimStatus status,
      double lastBalanceFetchAt,
      double lastBonusBalanceFetchAt,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class _$SimModelCopyWithImpl<$Res, $Val extends SimModel>
    implements $SimModelCopyWith<$Res> {
  _$SimModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? operator = null,
    Object? pinCode = freezed,
    Object? balance = null,
    Object? bonusBalance = null,
    Object? status = null,
    Object? lastBalanceFetchAt = null,
    Object? lastBonusBalanceFetchAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as NetworkOperator,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      bonusBalance: null == bonusBalance
          ? _value.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimStatus,
      lastBalanceFetchAt: null == lastBalanceFetchAt
          ? _value.lastBalanceFetchAt
          : lastBalanceFetchAt // ignore: cast_nullable_to_non_nullable
              as double,
      lastBonusBalanceFetchAt: null == lastBonusBalanceFetchAt
          ? _value.lastBonusBalanceFetchAt
          : lastBonusBalanceFetchAt // ignore: cast_nullable_to_non_nullable
              as double,
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
}

/// @nodoc
abstract class _$$SimModelImplCopyWith<$Res>
    implements $SimModelCopyWith<$Res> {
  factory _$$SimModelImplCopyWith(
          _$SimModelImpl value, $Res Function(_$SimModelImpl) then) =
      __$$SimModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      String name,
      String phoneNumber,
      NetworkOperator operator,
      String? pinCode,
      double balance,
      double bonusBalance,
      SimStatus status,
      double lastBalanceFetchAt,
      double lastBonusBalanceFetchAt,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});
}

/// @nodoc
class __$$SimModelImplCopyWithImpl<$Res>
    extends _$SimModelCopyWithImpl<$Res, _$SimModelImpl>
    implements _$$SimModelImplCopyWith<$Res> {
  __$$SimModelImplCopyWithImpl(
      _$SimModelImpl _value, $Res Function(_$SimModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? operator = null,
    Object? pinCode = freezed,
    Object? balance = null,
    Object? bonusBalance = null,
    Object? status = null,
    Object? lastBalanceFetchAt = null,
    Object? lastBonusBalanceFetchAt = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$SimModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as NetworkOperator,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      bonusBalance: null == bonusBalance
          ? _value.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimStatus,
      lastBalanceFetchAt: null == lastBalanceFetchAt
          ? _value.lastBalanceFetchAt
          : lastBalanceFetchAt // ignore: cast_nullable_to_non_nullable
              as double,
      lastBonusBalanceFetchAt: null == lastBonusBalanceFetchAt
          ? _value.lastBonusBalanceFetchAt
          : lastBonusBalanceFetchAt // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$SimModelImpl implements _SimModel {
  _$SimModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.name,
      required this.phoneNumber,
      required this.operator,
      this.pinCode,
      this.balance = 0,
      this.bonusBalance = 0,
      required this.status,
      required this.lastBalanceFetchAt,
      required this.lastBonusBalanceFetchAt,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _metadata = metadata;

  factory _$SimModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
// name
  @override
  final String name;
// phone number
  @override
  final String phoneNumber;
// operator
  @override
  final NetworkOperator operator;
// pin code
  @override
  final String? pinCode;
// balance
  @override
  @JsonKey()
  final double balance;
// bonusBalance
  @override
  @JsonKey()
  final double bonusBalance;
// status
  @override
  final SimStatus status;
// lastBalanceFetchAt
  @override
  final double lastBalanceFetchAt;
// lastBonusBalanceFetchAt
  @override
  final double lastBonusBalanceFetchAt;
// meta..
  final Map<String, dynamic> _metadata;
// meta..
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
    return 'SimModel(ref: $ref, name: $name, phoneNumber: $phoneNumber, operator: $operator, pinCode: $pinCode, balance: $balance, bonusBalance: $bonusBalance, status: $status, lastBalanceFetchAt: $lastBalanceFetchAt, lastBonusBalanceFetchAt: $lastBonusBalanceFetchAt, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusBalance, bonusBalance) ||
                other.bonusBalance == bonusBalance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastBalanceFetchAt, lastBalanceFetchAt) ||
                other.lastBalanceFetchAt == lastBalanceFetchAt) &&
            (identical(
                    other.lastBonusBalanceFetchAt, lastBonusBalanceFetchAt) ||
                other.lastBonusBalanceFetchAt == lastBonusBalanceFetchAt) &&
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
      name,
      phoneNumber,
      operator,
      pinCode,
      balance,
      bonusBalance,
      status,
      lastBalanceFetchAt,
      lastBonusBalanceFetchAt,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimModelImplCopyWith<_$SimModelImpl> get copyWith =>
      __$$SimModelImplCopyWithImpl<_$SimModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimModelImplToJson(
      this,
    );
  }
}

abstract class _SimModel implements SimModel {
  factory _SimModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final String name,
          required final String phoneNumber,
          required final NetworkOperator operator,
          final String? pinCode,
          final double balance,
          final double bonusBalance,
          required final SimStatus status,
          required final double lastBalanceFetchAt,
          required final double lastBonusBalanceFetchAt,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$SimModelImpl;

  factory _SimModel.fromJson(Map<String, dynamic> json) =
      _$SimModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override // name
  String get name;
  @override // phone number
  String get phoneNumber;
  @override // operator
  NetworkOperator get operator;
  @override // pin code
  String? get pinCode;
  @override // balance
  double get balance;
  @override // bonusBalance
  double get bonusBalance;
  @override // status
  SimStatus get status;
  @override // lastBalanceFetchAt
  double get lastBalanceFetchAt;
  @override // lastBonusBalanceFetchAt
  double get lastBonusBalanceFetchAt;
  @override // meta..
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
  _$$SimModelImplCopyWith<_$SimModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
