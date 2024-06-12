import 'package:howoldami/data/age/ageRepository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  test('Hannes is 50 in germany', () async {
    final ageRepo = AgeRepository();

    final hannesAge = await ageRepo.getAge(name: 'Hannes', country: 'DE');

    expect(hannesAge.age, 50);
  });
  test('Hannes is 61 in the us', () async {
    final ageRepo = AgeRepository();

    final hannesAge = await ageRepo.getAge(name: 'Hannes', country: 'US');

    expect(hannesAge.age, 61);
  });

  test('combining counties should give a weighted average', () async {
    final ageRepo = AgeRepository();

    final hannesAge = await ageRepo
        .getAgeInCountries(name: 'Hannes', countries: ['DE', 'US']);

    //should be between both ages
    expect(hannesAge.age, greaterThan(50));
    expect(hannesAge.age, lessThan(61));
  });
}
