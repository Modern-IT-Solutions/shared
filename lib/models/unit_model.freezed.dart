// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) {
  return _UnitModel.fromJson(json);
}

/// @nodoc
mixin _$UnitModel {
  @ModelRefSerializer()
  ModelRef get ref => throw _privateConstructorUsedError;
  @ColorSerializer()
  Color get color => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  List<String> get fields => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  UnitStatisticsModel get statistics =>
      throw _privateConstructorUsedError; // visibility
  ModelVisibility get visibility => throw _privateConstructorUsedError;
  ProfileModel get teacher => throw _privateConstructorUsedError;
  UnitSubjectModel get subject => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampDateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampDateTimeSerializer()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitModelCopyWith<UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitModelCopyWith<$Res> {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) then) =
      _$UnitModelCopyWithImpl<$Res, UnitModel>;
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      @ColorSerializer() Color color,
      String description,
      double discount,
      Duration duration,
      List<String> fields,
      String name,
      double price,
      String title,
      UnitStatisticsModel statistics,
      ModelVisibility visibility,
      ProfileModel teacher,
      UnitSubjectModel subject,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  $UnitStatisticsModelCopyWith<$Res> get statistics;
  $ProfileModelCopyWith<$Res> get teacher;
  $UnitSubjectModelCopyWith<$Res> get subject;
}

/// @nodoc
class _$UnitModelCopyWithImpl<$Res, $Val extends UnitModel>
    implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? color = null,
    Object? description = null,
    Object? discount = null,
    Object? duration = null,
    Object? fields = null,
    Object? name = null,
    Object? price = null,
    Object? title = null,
    Object? statistics = null,
    Object? visibility = null,
    Object? teacher = null,
    Object? subject = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as UnitStatisticsModel,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ModelVisibility,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as UnitSubjectModel,
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
  $UnitStatisticsModelCopyWith<$Res> get statistics {
    return $UnitStatisticsModelCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get teacher {
    return $ProfileModelCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitSubjectModelCopyWith<$Res> get subject {
    return $UnitSubjectModelCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnitModelImplCopyWith<$Res>
    implements $UnitModelCopyWith<$Res> {
  factory _$$UnitModelImplCopyWith(
          _$UnitModelImpl value, $Res Function(_$UnitModelImpl) then) =
      __$$UnitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ModelRefSerializer() ModelRef ref,
      @ColorSerializer() Color color,
      String description,
      double discount,
      Duration duration,
      List<String> fields,
      String name,
      double price,
      String title,
      UnitStatisticsModel statistics,
      ModelVisibility visibility,
      ProfileModel teacher,
      UnitSubjectModel subject,
      @TimestampDateTimeSerializer() DateTime createdAt,
      @TimestampDateTimeSerializer() DateTime updatedAt,
      @NullableTimestampDateTimeSerializer() DateTime? deletedAt});

  @override
  $UnitStatisticsModelCopyWith<$Res> get statistics;
  @override
  $ProfileModelCopyWith<$Res> get teacher;
  @override
  $UnitSubjectModelCopyWith<$Res> get subject;
}

/// @nodoc
class __$$UnitModelImplCopyWithImpl<$Res>
    extends _$UnitModelCopyWithImpl<$Res, _$UnitModelImpl>
    implements _$$UnitModelImplCopyWith<$Res> {
  __$$UnitModelImplCopyWithImpl(
      _$UnitModelImpl _value, $Res Function(_$UnitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? color = null,
    Object? description = null,
    Object? discount = null,
    Object? duration = null,
    Object? fields = null,
    Object? name = null,
    Object? price = null,
    Object? title = null,
    Object? statistics = null,
    Object? visibility = null,
    Object? teacher = null,
    Object? subject = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$UnitModelImpl(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ModelRef,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as UnitStatisticsModel,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ModelVisibility,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as UnitSubjectModel,
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
class _$UnitModelImpl implements _UnitModel {
  _$UnitModelImpl(
      {@ModelRefSerializer() required this.ref,
      @ColorSerializer() required this.color,
      this.description = "بلا وصف",
      required this.discount,
      required this.duration,
      required final List<String> fields,
      required this.name,
      required this.price,
      required this.title,
      required this.statistics,
      this.visibility = ModelVisibility.visible,
      required this.teacher,
      required this.subject,
      @TimestampDateTimeSerializer() required this.createdAt,
      @TimestampDateTimeSerializer() required this.updatedAt,
      @NullableTimestampDateTimeSerializer() this.deletedAt})
      : _fields = fields;

  factory _$UnitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitModelImplFromJson(json);

  @override
  @ModelRefSerializer()
  final ModelRef ref;
  @override
  @ColorSerializer()
  final Color color;
  @override
  @JsonKey()
  final String description;
  @override
  final double discount;
  @override
  final Duration duration;
  final List<String> _fields;
  @override
  List<String> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  final String name;
  @override
  final double price;
  @override
  final String title;
  @override
  final UnitStatisticsModel statistics;
// visibility
  @override
  @JsonKey()
  final ModelVisibility visibility;
  @override
  final ProfileModel teacher;
  @override
  final UnitSubjectModel subject;
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
    return 'UnitModel(ref: $ref, color: $color, description: $description, discount: $discount, duration: $duration, fields: $fields, name: $name, price: $price, title: $title, statistics: $statistics, visibility: $visibility, teacher: $teacher, subject: $subject, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitModelImpl &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.subject, subject) || other.subject == subject) &&
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
      color,
      description,
      discount,
      duration,
      const DeepCollectionEquality().hash(_fields),
      name,
      price,
      title,
      statistics,
      visibility,
      teacher,
      subject,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitModelImplCopyWith<_$UnitModelImpl> get copyWith =>
      __$$UnitModelImplCopyWithImpl<_$UnitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitModelImplToJson(
      this,
    );
  }
}

abstract class _UnitModel implements UnitModel {
  factory _UnitModel(
          {@ModelRefSerializer() required final ModelRef ref,
          @ColorSerializer() required final Color color,
          final String description,
          required final double discount,
          required final Duration duration,
          required final List<String> fields,
          required final String name,
          required final double price,
          required final String title,
          required final UnitStatisticsModel statistics,
          final ModelVisibility visibility,
          required final ProfileModel teacher,
          required final UnitSubjectModel subject,
          @TimestampDateTimeSerializer() required final DateTime createdAt,
          @TimestampDateTimeSerializer() required final DateTime updatedAt,
          @NullableTimestampDateTimeSerializer() final DateTime? deletedAt}) =
      _$UnitModelImpl;

  factory _UnitModel.fromJson(Map<String, dynamic> json) =
      _$UnitModelImpl.fromJson;

  @override
  @ModelRefSerializer()
  ModelRef get ref;
  @override
  @ColorSerializer()
  Color get color;
  @override
  String get description;
  @override
  double get discount;
  @override
  Duration get duration;
  @override
  List<String> get fields;
  @override
  String get name;
  @override
  double get price;
  @override
  String get title;
  @override
  UnitStatisticsModel get statistics;
  @override // visibility
  ModelVisibility get visibility;
  @override
  ProfileModel get teacher;
  @override
  UnitSubjectModel get subject;
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
  _$$UnitModelImplCopyWith<_$UnitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
