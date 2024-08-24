import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ad.freezed.dart';
part 'home_ad.g.dart';

@freezed
class HomeAd with _$HomeAd {

  factory HomeAd({
    required String id,
    required String image,
    required String link,
    required String title,
    String? subtitle,
    required HomeSectionType type,
    required bool enabled,
  }) = _HomeAd;

  factory HomeAd.fromJson(Map<String, dynamic> json) => _$HomeAdFromJson(json);
}


enum HomeSectionType {
  popup,
  other,
}