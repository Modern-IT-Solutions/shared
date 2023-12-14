// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_item_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillItemTemplateModel _$BillItemTemplateModelFromJson(
    Map<String, dynamic> json) {
  return _BillItemTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$BillItemTemplateModel {
  String? get reference => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillItemTemplateModelCopyWith<BillItemTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemTemplateModelCopyWith<$Res> {
  factory $BillItemTemplateModelCopyWith(BillItemTemplateModel value,
          $Res Function(BillItemTemplateModel) then) =
      _$BillItemTemplateModelCopyWithImpl<$Res, BillItemTemplateModel>;
  @useResult
  $Res call(
      {String? reference,
      String name,
      String? description,
      double price,
      bool enabled});
}

/// @nodoc
class _$BillItemTemplateModelCopyWithImpl<$Res,
        $Val extends BillItemTemplateModel>
    implements $BillItemTemplateModelCopyWith<$Res> {
  _$BillItemTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillItemTemplateModelImplCopyWith<$Res>
    implements $BillItemTemplateModelCopyWith<$Res> {
  factory _$$BillItemTemplateModelImplCopyWith(
          _$BillItemTemplateModelImpl value,
          $Res Function(_$BillItemTemplateModelImpl) then) =
      __$$BillItemTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reference,
      String name,
      String? description,
      double price,
      bool enabled});
}

/// @nodoc
class __$$BillItemTemplateModelImplCopyWithImpl<$Res>
    extends _$BillItemTemplateModelCopyWithImpl<$Res,
        _$BillItemTemplateModelImpl>
    implements _$$BillItemTemplateModelImplCopyWith<$Res> {
  __$$BillItemTemplateModelImplCopyWithImpl(_$BillItemTemplateModelImpl _value,
      $Res Function(_$BillItemTemplateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? enabled = null,
  }) {
    return _then(_$BillItemTemplateModelImpl(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillItemTemplateModelImpl implements _BillItemTemplateModel {
  _$BillItemTemplateModelImpl(
      {this.reference,
      required this.name,
      this.description,
      required this.price,
      this.enabled = true});

  factory _$BillItemTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillItemTemplateModelImplFromJson(json);

  @override
  final String? reference;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double price;
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'BillItemTemplateModel(reference: $reference, name: $name, description: $description, price: $price, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemTemplateModelImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reference, name, description, price, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemTemplateModelImplCopyWith<_$BillItemTemplateModelImpl>
      get copyWith => __$$BillItemTemplateModelImplCopyWithImpl<
          _$BillItemTemplateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillItemTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _BillItemTemplateModel implements BillItemTemplateModel {
  factory _BillItemTemplateModel(
      {final String? reference,
      required final String name,
      final String? description,
      required final double price,
      final bool enabled}) = _$BillItemTemplateModelImpl;

  factory _BillItemTemplateModel.fromJson(Map<String, dynamic> json) =
      _$BillItemTemplateModelImpl.fromJson;

  @override
  String? get reference;
  @override
  String get name;
  @override
  String? get description;
  @override
  double get price;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$BillItemTemplateModelImplCopyWith<_$BillItemTemplateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
