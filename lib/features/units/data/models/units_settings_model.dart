import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'units_settings_model.freezed.dart';
part 'units_settings_model.g.dart';

@freezed
class UnitsSettingsModel with _$UnitsSettingsModel implements Model {

  const factory UnitsSettingsModel({
    @ModelRefSerializer() required ModelRef ref,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
    /// option model field
    @Default([]) List<String> subjects,
    @Default([]) List<String> fields,
  }) = _UnitsSettingsModel;

  factory UnitsSettingsModel.fromJson(Map<String, dynamic> json) => _$UnitsSettingsModelFromJson(json);
}


Future<UnitsSettingsModel?> getUnitsSettings() async {
  var data = await getSettings().getOption('units');
  var settingsData = <String,dynamic>{
        "ref": ".options.units",
        "createdAt": Timestamp.fromDate(DateTime.now()),
        "updatedAt": Timestamp.fromDate(DateTime.now()),
        "subjects": [],
        "fields": [],
        ... data ?? {}
    };
  return UnitsSettingsModel.fromJson(settingsData);
}