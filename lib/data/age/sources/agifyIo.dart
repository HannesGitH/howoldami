import 'dart:convert';
import 'package:howoldami/data/age/ageData.dart';
import 'package:http/http.dart' as http;

class Agifyio {
  static const String baseUrl = 'https://api.agify.io';

  Future<AgeData> getAge({required String name, String? country}) async {
    final url = country == null
        ? '$baseUrl?name=$name'
        : '$baseUrl?name=$name&country_id=$country';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        return AgeData.fromJson(jsonDecode(response.body));
      } catch (e) {
        throw Exception(
            'Failed to parse age, probably no data found for that name and country');
      }
    } else {
      throw Exception('Failed to load age');
    }
  }
}
