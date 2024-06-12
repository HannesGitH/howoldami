import 'package:howoldami/data/age/ageData.dart';
import 'package:howoldami/data/age/sources/agifyIo.dart';

import 'sources/ageCache.dart';

class AgeRepository {
  final _cache = AgeCache();
  final _api = Agifyio();

  /// Throws an [Exception] In case there is no one with that name (in the selected country)
  Future<AgeData> getAge({required String name, String? country}) async {
    try {
      return _cachedGetAge(name: name, country: country);
    } catch (e) {
      return _api.getAge(name: name, country: country);
    }
  }

  Future<AgeData> _cachedGetAge({required String name, String? country}) async {
    final cachedAge = await _cache.getAge(name: name, country: country);
    if (cachedAge != null) {
      return cachedAge;
    }
    final apiAge = await _api.getAge(name: name, country: country);
    await _cache.setAge(apiAge);
    return apiAge;
  }

  /// Throws an [Exception] In case there is no one with that name (in the selected countries)
  Future<AgeData> getAgeInCountries(
      {required String name, required List<String> countries}) async {
    final countryAges = (await Future.wait(countries.map((country) async {
      try {
        return await getAge(name: name, country: country);
      } catch (e) {
        return null;
      }
    }).toList()))
        .whereType<AgeData>();
    if (countryAges.isEmpty) {
      throw Exception('No data found for $name in any of the countries');
    }
    return countryAges.reduce((a, b) {
      final totalCount = a.count + b.count;
      // print('totalCount: $totalCount, a: ${a.count}, b: ${b.count}');
      return AgeData(
        name: a.name,
        country: 'user_selection_multi_country',
        // weighted average
        age: (a.age * a.count + b.age * b.count) / totalCount,
        count: totalCount,
      );
    });
  }
}
