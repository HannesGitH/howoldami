import 'package:howoldami/data/age/ageData.dart';
import 'package:howoldami/data/age/sources/agifyIo.dart';

import 'sources/ageCache.dart';

class AgeRepository {
  final _cache = AgeCache();
  final _api = Agifyio();

  Future<AgeData> getAge(
      {required String name, required String country}) async {
    try {
      return _cachedGetAge(name: name, country: country);
    } catch (e) {
      return _api.getAge(name: name, country: country);
    }
  }

  Future<AgeData> _cachedGetAge(
      {required String name, required String country}) async {
    final cachedAge = await _cache.getAge(name: name, country: country);
    if (cachedAge != null) {
      return cachedAge;
    }
    final apiAge = await _api.getAge(name: name, country: country);
    await _cache.setAge(apiAge);
    return apiAge;
  }
}
