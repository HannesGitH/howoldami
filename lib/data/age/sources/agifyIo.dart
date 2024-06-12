import 'dart:convert';
import 'package:howoldami/data/age/ageData.dart';
import 'package:http/http.dart' as http;

class Agifyio {
  static const String baseUrl = 'https://api.agify.io';

  Future<AgeData> getAge(
      {required String name, required String country}) async {
    final response =
        await http.get(Uri.parse('$baseUrl?name=$name&country_id=$country'));
    if (response.statusCode == 200) {
      return AgeData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load age');
    }
  }
}
