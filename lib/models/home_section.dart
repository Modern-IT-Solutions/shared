import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_section.freezed.dart';
part 'home_section.g.dart';

@freezed
class HomeSection with _$HomeSection {

  factory HomeSection({
    required String id,
    required bool enabled,
    required int order,
    String? subtitle,
    required String title,
    required List<String> units,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) => _$HomeSectionFromJson(json);
}


// extenion (isConst when start with CST_)
extension CSTHomeSection on HomeSection {
  bool get isConst => id.startsWith('CST_');
}