// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssistanceModel _$AssistanceModelFromJson(Map<String, dynamic> json) {
  return _AssistanceModel.fromJson(json);
}

/// @nodoc
mixin _$AssistanceModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  StationModel get station => throw _privateConstructorUsedError;
  Map<String, ProfileModel> get technicians =>
      throw _privateConstructorUsedError;
  AssistanceStatus get status => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  List<AttachmentModel> get attachments => throw _privateConstructorUsedError;
  ProfileModel? get reviewer => throw _privateConstructorUsedError;
  InterventionModel? get intervention => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssistanceModelCopyWith<AssistanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistanceModelCopyWith<$Res> {
  factory $AssistanceModelCopyWith(
          AssistanceModel value, $Res Function(AssistanceModel) then) =
      _$AssistanceModelCopyWithImpl<$Res, AssistanceModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      StationModel station,
      Map<String, ProfileModel> technicians,
      AssistanceStatus status,
      DateTime date,
      String note,
      List<AttachmentModel> attachments,
      ProfileModel? reviewer,
      InterventionModel? intervention,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  $StationModelCopyWith<$Res> get station;
  $ProfileModelCopyWith<$Res>? get reviewer;
  $InterventionModelCopyWith<$Res>? get intervention;
}

/// @nodoc
class _$AssistanceModelCopyWithImpl<$Res, $Val extends AssistanceModel>
    implements $AssistanceModelCopyWith<$Res> {
  _$AssistanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? station = null,
    Object? technicians = null,
    Object? status = null,
    Object? date = null,
    Object? note = null,
    Object? attachments = null,
    Object? reviewer = freezed,
    Object? intervention = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationModel,
      technicians: null == technicians
          ? _value.technicians
          : technicians // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssistanceStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      intervention: freezed == intervention
          ? _value.intervention
          : intervention // ignore: cast_nullable_to_non_nullable
              as InterventionModel?,
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
  $StationModelCopyWith<$Res> get station {
    return $StationModelCopyWith<$Res>(_value.station, (value) {
      return _then(_value.copyWith(station: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get reviewer {
    if (_value.reviewer == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.reviewer!, (value) {
      return _then(_value.copyWith(reviewer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InterventionModelCopyWith<$Res>? get intervention {
    if (_value.intervention == null) {
      return null;
    }

    return $InterventionModelCopyWith<$Res>(_value.intervention!, (value) {
      return _then(_value.copyWith(intervention: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssistanceModelImplCopyWith<$Res>
    implements $AssistanceModelCopyWith<$Res> {
  factory _$$AssistanceModelImplCopyWith(_$AssistanceModelImpl value,
          $Res Function(_$AssistanceModelImpl) then) =
      __$$AssistanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      StationModel station,
      Map<String, ProfileModel> technicians,
      AssistanceStatus status,
      DateTime date,
      String note,
      List<AttachmentModel> attachments,
      ProfileModel? reviewer,
      InterventionModel? intervention,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @TimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $StationModelCopyWith<$Res> get station;
  @override
  $ProfileModelCopyWith<$Res>? get reviewer;
  @override
  $InterventionModelCopyWith<$Res>? get intervention;
}

/// @nodoc
class __$$AssistanceModelImplCopyWithImpl<$Res>
    extends _$AssistanceModelCopyWithImpl<$Res, _$AssistanceModelImpl>
    implements _$$AssistanceModelImplCopyWith<$Res> {
  __$$AssistanceModelImplCopyWithImpl(
      _$AssistanceModelImpl _value, $Res Function(_$AssistanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? station = null,
    Object? technicians = null,
    Object? status = null,
    Object? date = null,
    Object? note = null,
    Object? attachments = null,
    Object? reviewer = freezed,
    Object? intervention = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$AssistanceModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationModel,
      technicians: null == technicians
          ? _value._technicians
          : technicians // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssistanceStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      intervention: freezed == intervention
          ? _value.intervention
          : intervention // ignore: cast_nullable_to_non_nullable
              as InterventionModel?,
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
class _$AssistanceModelImpl implements _AssistanceModel {
  _$AssistanceModelImpl(
      {@ModelRefSerializer() required this.ref,
      required this.station,
      required final Map<String, ProfileModel> technicians,
      required this.status,
      required this.date,
      required this.note,
      required final List<AttachmentModel> attachments,
      required this.reviewer,
      required this.intervention,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @TimestampDateTimeSerializer() this.deletedAt})
      : _technicians = technicians,
        _attachments = attachments;

  factory _$AssistanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssistanceModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  final StationModel station;
  final Map<String, ProfileModel> _technicians;
  @override
  Map<String, ProfileModel> get technicians {
    if (_technicians is EqualUnmodifiableMapView) return _technicians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_technicians);
  }

  @override
  final AssistanceStatus status;
  @override
  final DateTime date;
  @override
  final String note;
  final List<AttachmentModel> _attachments;
  @override
  List<AttachmentModel> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final ProfileModel? reviewer;
  @override
  final InterventionModel? intervention;
  @override
  @TimestampDateTimeSerializer()
  final DateTime createdAt;
  @override
  @TimestampDateTimeSerializer()
  final DateTime updatedAt;
  @override
  @TimestampDateTimeSerializer()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'AssistanceModel(ref: $ref, station: $station, technicians: $technicians, status: $status, date: $date, note: $note, attachments: $attachments, reviewer: $reviewer, intervention: $intervention, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistanceModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.station, station) || other.station == station) &&
            const DeepCollectionEquality()
                .equals(other._technicians, _technicians) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer) &&
            (identical(other.intervention, intervention) ||
                other.intervention == intervention) &&
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
      station,
      const DeepCollectionEquality().hash(_technicians),
      status,
      date,
      note,
      const DeepCollectionEquality().hash(_attachments),
      reviewer,
      intervention,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistanceModelImplCopyWith<_$AssistanceModelImpl> get copyWith =>
      __$$AssistanceModelImplCopyWithImpl<_$AssistanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssistanceModelImplToJson(
      this,
    );
  }
}

abstract class _AssistanceModel implements AssistanceModel {
  factory _AssistanceModel(
          {@ModelRefSerializer() required final ModelRef ref,
          required final StationModel station,
          required final Map<String, ProfileModel> technicians,
          required final AssistanceStatus status,
          required final DateTime date,
          required final String note,
          required final List<AttachmentModel> attachments,
          required final ProfileModel? reviewer,
          required final InterventionModel? intervention,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @TimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$AssistanceModelImpl;

  factory _AssistanceModel.fromJson(Map<String, dynamic> json) =
      _$AssistanceModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  StationModel get station;
  @override
  Map<String, ProfileModel> get technicians;
  @override
  AssistanceStatus get status;
  @override
  DateTime get date;
  @override
  String get note;
  @override
  List<AttachmentModel> get attachments;
  @override
  ProfileModel? get reviewer;
  @override
  InterventionModel? get intervention;
  @override
  @TimestampDateTimeSerializer()
  DateTime get createdAt;
  @override
  @TimestampDateTimeSerializer()
  DateTime get updatedAt;
  @override
  @TimestampDateTimeSerializer()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$AssistanceModelImplCopyWith<_$AssistanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
