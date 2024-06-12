// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ageData.freezed.dart';
part 'ageData.g.dart';

const countryKey = 'country_id';
const worldCountry = 'WORLD';

@freezed
class AgeData with _$AgeData {
  const factory AgeData({
    required String name,
    @JsonKey(name: countryKey) @Default(worldCountry) String country,
    required num age,
    required int count,
  }) = _AgeData;

  factory AgeData.fromJson(Map<String, dynamic> json) =>
      _$AgeDataFromJson(json);
}
