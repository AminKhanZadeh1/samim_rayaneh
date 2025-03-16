import 'package:flutter_test/flutter_test.dart';
import 'package:samim_rayaneh/Core/DI/locator.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Repository/countries_repo_impl.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';

void main() async {
  late CountriesRepoImpl repository;
  setUpAll(() async {
    await setup();
    repository = CountriesRepoImpl(apiService: locator());
  });

  test("Real API test", () async {
    final result = await repository.getCountries();

    result.fold(
      (failure) {
        fail('Expected success but got failure: $failure');
      },
      (countries) {
        expect(countries, isA<List<CountryEntity>>());
        expect(countries, isNotEmpty);
        expect(countries.first.name, "افغانستان");
      },
    );
  });
}
