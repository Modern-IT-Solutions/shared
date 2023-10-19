import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import 'unit_model.dart';

part 'unit_section_item_model.freezed.dart';
part 'unit_section_item_model.g.dart';

enum UnitSectionItemType {
  doc,
  live,
  video,
  quiz,
}

@freezed
class UnitSectionItemModel with _$UnitSectionItemModel implements Model {
  factory UnitSectionItemModel({
    @ModelRefSerializer() required ModelRef ref,
    required UnitSectionItemType type,
    required String title,
    String? description,
    required int order,
    @Default(false) bool isFree,
    // doc and lev (meet)
    @Default("") String url,
    // live
    @Default("") String hash,
    String? poster,
    @Default(false) bool isLive,
    @Default(false) bool useYoutubePlayer,
    // live-end

    @Default(ModelVisibility.visible) ModelVisibility visibility,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _UnitSectionItemModel;

  factory UnitSectionItemModel.fromJson(Map<String, dynamic> json) => _$UnitSectionItemModelFromJson(json);

  static ModelDescription<UnitSectionItemModel> get modelDescription => ModelDescription<UnitSectionItemModel>(
        fields: {},
        name: "Items",
        path: "items",
        fromJson: UnitSectionItemModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
            title: model.title,
            subtitle: model.description,
        ),
        actions: [],
      );
}