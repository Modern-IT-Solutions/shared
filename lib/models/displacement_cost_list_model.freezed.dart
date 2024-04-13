// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'displacement_cost_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DisplacementCostModel _$DisplacementCostModelFromJson(
    Map<String, dynamic> json) {
  return _DisplacementCostModel.fromJson(json);
}

/// @nodoc
mixin _$DisplacementCostModel {
  String get region => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisplacementCostModelCopyWith<DisplacementCostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplacementCostModelCopyWith<$Res> {
  factory $DisplacementCostModelCopyWith(DisplacementCostModel value,
          $Res Function(DisplacementCostModel) then) =
      _$DisplacementCostModelCopyWithImpl<$Res, DisplacementCostModel>;
  @useResult
  $Res call({String region, String state, double cost});
}

/// @nodoc
class _$DisplacementCostModelCopyWithImpl<$Res,
        $Val extends DisplacementCostModel>
    implements $DisplacementCostModelCopyWith<$Res> {
  _$DisplacementCostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? state = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplacementCostModelImplCopyWith<$Res>
    implements $DisplacementCostModelCopyWith<$Res> {
  factory _$$DisplacementCostModelImplCopyWith(
          _$DisplacementCostModelImpl value,
          $Res Function(_$DisplacementCostModelImpl) then) =
      __$$DisplacementCostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String region, String state, double cost});
}

/// @nodoc
class __$$DisplacementCostModelImplCopyWithImpl<$Res>
    extends _$DisplacementCostModelCopyWithImpl<$Res,
        _$DisplacementCostModelImpl>
    implements _$$DisplacementCostModelImplCopyWith<$Res> {
  __$$DisplacementCostModelImplCopyWithImpl(_$DisplacementCostModelImpl _value,
      $Res Function(_$DisplacementCostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? state = null,
    Object? cost = null,
  }) {
    return _then(_$DisplacementCostModelImpl(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplacementCostModelImpl implements _DisplacementCostModel {
  _$DisplacementCostModelImpl(
      {required this.region, required this.state, required this.cost});

  factory _$DisplacementCostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplacementCostModelImplFromJson(json);

  @override
  final String region;
  @override
  final String state;
  @override
  final double cost;

  @override
  String toString() {
    return 'DisplacementCostModel(region: $region, state: $state, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplacementCostModelImpl &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, region, state, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplacementCostModelImplCopyWith<_$DisplacementCostModelImpl>
      get copyWith => __$$DisplacementCostModelImplCopyWithImpl<
          _$DisplacementCostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplacementCostModelImplToJson(
      this,
    );
  }
}

abstract class _DisplacementCostModel implements DisplacementCostModel {
  factory _DisplacementCostModel(
      {required final String region,
      required final String state,
      required final double cost}) = _$DisplacementCostModelImpl;

  factory _DisplacementCostModel.fromJson(Map<String, dynamic> json) =
      _$DisplacementCostModelImpl.fromJson;

  @override
  String get region;
  @override
  String get state;
  @override
  double get cost;
  @override
  @JsonKey(ignore: true)
  _$$DisplacementCostModelImplCopyWith<_$DisplacementCostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
