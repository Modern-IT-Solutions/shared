// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InterventionModel _$InterventionModelFromJson(Map<String, dynamic> json) {
  return _InterventionModel.fromJson(json);
}

/// @nodoc
mixin _$InterventionModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  InterventionStatus get status => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get date => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // required List<AttachmentModel> attachments,
  List<AttachmentModel> get attachments => throw _privateConstructorUsedError;
  InterventionType get type => throw _privateConstructorUsedError;
  ProfileModel get intervener => throw _privateConstructorUsedError;
  BillModel? get bill =>
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
  $InterventionModelCopyWith<InterventionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterventionModelCopyWith<$Res> {
  factory $InterventionModelCopyWith(
          InterventionModel value, $Res Function(InterventionModel) then) =
      _$InterventionModelCopyWithImpl<$Res, InterventionModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      InterventionStatus status,
      @TimestampDateTimeSerializer() DateTime date,
      String description,
      List<AttachmentModel> attachments,
      InterventionType type,
      ProfileModel intervener,
      BillModel? bill,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  $ProfileModelCopyWith<$Res> get intervener;
  $BillModelCopyWith<$Res>? get bill;
}

/// @nodoc
class _$InterventionModelCopyWithImpl<$Res, $Val extends InterventionModel>
    implements $InterventionModelCopyWith<$Res> {
  _$InterventionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? date = null,
    Object? description = null,
    Object? attachments = null,
    Object? type = null,
    Object? intervener = null,
    Object? bill = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InterventionStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InterventionType,
      intervener: null == intervener
          ? _value.intervener
          : intervener // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as BillModel?,
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
  $ProfileModelCopyWith<$Res> get intervener {
    return $ProfileModelCopyWith<$Res>(_value.intervener, (value) {
      return _then(_value.copyWith(intervener: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillModelCopyWith<$Res>? get bill {
    if (_value.bill == null) {
      return null;
    }

    return $BillModelCopyWith<$Res>(_value.bill!, (value) {
      return _then(_value.copyWith(bill: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InterventionModelImplCopyWith<$Res>
    implements $InterventionModelCopyWith<$Res> {
  factory _$$InterventionModelImplCopyWith(_$InterventionModelImpl value,
          $Res Function(_$InterventionModelImpl) then) =
      __$$InterventionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      InterventionStatus status,
      @TimestampDateTimeSerializer() DateTime date,
      String description,
      List<AttachmentModel> attachments,
      InterventionType type,
      ProfileModel intervener,
      BillModel? bill,
      Map<String, dynamic> metadata,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $ProfileModelCopyWith<$Res> get intervener;
  @override
  $BillModelCopyWith<$Res>? get bill;
}

/// @nodoc
class __$$InterventionModelImplCopyWithImpl<$Res>
    extends _$InterventionModelCopyWithImpl<$Res, _$InterventionModelImpl>
    implements _$$InterventionModelImplCopyWith<$Res> {
  __$$InterventionModelImplCopyWithImpl(_$InterventionModelImpl _value,
      $Res Function(_$InterventionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? status = null,
    Object? date = null,
    Object? description = null,
    Object? attachments = null,
    Object? type = null,
    Object? intervener = null,
    Object? bill = freezed,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$InterventionModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InterventionStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InterventionType,
      intervener: null == intervener
          ? _value.intervener
          : intervener // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as BillModel?,
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
class _$InterventionModelImpl implements _InterventionModel {
  _$InterventionModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.status,
      @TimestampDateTimeSerializer() required this.date,
      required this.description,
      required final List<AttachmentModel> attachments,
      required this.type,
      required this.intervener,
      this.bill,
      final Map<String, dynamic> metadata = const {},
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _attachments = attachments,
        _metadata = metadata;

  factory _$InterventionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterventionModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final InterventionStatus status;
  @override
  @TimestampDateTimeSerializer()
  final DateTime date;
  @override
  final String description;
// required List<AttachmentModel> attachments,
  final List<AttachmentModel> _attachments;
// required List<AttachmentModel> attachments,
  @override
  List<AttachmentModel> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final InterventionType type;
  @override
  final ProfileModel intervener;
  @override
  final BillModel? bill;
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
    return 'InterventionModel(ref: $ref, status: $status, date: $date, description: $description, attachments: $attachments, type: $type, intervener: $intervener, bill: $bill, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterventionModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.intervener, intervener) ||
                other.intervener == intervener) &&
            (identical(other.bill, bill) || other.bill == bill) &&
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
      status,
      date,
      description,
      const DeepCollectionEquality().hash(_attachments),
      type,
      intervener,
      bill,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterventionModelImplCopyWith<_$InterventionModelImpl> get copyWith =>
      __$$InterventionModelImplCopyWithImpl<_$InterventionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterventionModelImplToJson(
      this,
    );
  }
}

abstract class _InterventionModel implements InterventionModel {
  factory _InterventionModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final InterventionStatus status,
          @TimestampDateTimeSerializer() required final DateTime date,
          required final String description,
          required final List<AttachmentModel> attachments,
          required final InterventionType type,
          required final ProfileModel intervener,
          final BillModel? bill,
          final Map<String, dynamic> metadata,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$InterventionModelImpl;

  factory _InterventionModel.fromJson(Map<String, dynamic> json) =
      _$InterventionModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  InterventionStatus get status;
  @override
  @TimestampDateTimeSerializer()
  DateTime get date;
  @override
  String get description;
  @override // required List<AttachmentModel> attachments,
  List<AttachmentModel> get attachments;
  @override
  InterventionType get type;
  @override
  ProfileModel get intervener;
  @override
  BillModel? get bill;
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
  _$$InterventionModelImplCopyWith<_$InterventionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
