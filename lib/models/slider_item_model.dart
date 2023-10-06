import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_item_model.freezed.dart';
part 'slider_item_model.g.dart';

@freezed
class SliderItem with _$SliderItem {

  factory SliderItem({
    required SliderItemType type,
    required String title,
    String? description,
    required String src,
    String? action,
  }) = _SliderItem;

  factory SliderItem.fromJson(Map<String, dynamic> json) => _$SliderItemFromJson(json);
}


/// enum [SliderItemType] is an enum that represents the type of the slider item.
enum SliderItemType {
  /// SliderItemType.image
  image,

  /// SliderItemType.video
  video,

  /// SliderItemType.widget
  widget,
}