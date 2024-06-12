import 'package:howoldami/data/age/ageRepository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  test('Hannes is 50 in germany', () async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    final ageRepo = AgeRepository();

    final hannesAge = await ageRepo.getAge(name: 'Hannes', country: 'DE');

    expect(hannesAge.age, 50);
  });
}
