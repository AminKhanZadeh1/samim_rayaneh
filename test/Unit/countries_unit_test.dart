import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Models/country_model.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Repository/countries_repo_impl.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Source/Remote/countries_api_service.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';

@GenerateMocks([CountriesApiService, CountriesRepoImpl])
import 'countries_unit_test.mocks.dart';

void main() {
  late MockCountriesApiService mockApiService;
  late MockCountriesRepoImpl mockCountriesRepoImpl;

  setUp(() {
    mockApiService = MockCountriesApiService();
    mockCountriesRepoImpl = MockCountriesRepoImpl();
  });

  test('getCountries should return a list of CountryEntity', () async {
    final fakeJson = [
      {
        "name": "افغانستان",
        "capital": "کابل",
        "code": "AF",
        "flag": "https://flagcdn.com/w320/af.png"
      },
      {
        "name": "آلبانی",
        "capital": "تیرانا",
        "code": "AL",
        "flag": "https://flagcdn.com/w320/al.png"
      },
      {
        "name": "الجزایر",
        "capital": "الجزیره",
        "code": "DZ",
        "flag": "https://flagcdn.com/w320/dz.png"
      },
    ];

    when(mockApiService.getCountries())
        .thenAnswer((_) async => Right(fakeJson));

    when(mockCountriesRepoImpl.getCountries())
        .thenAnswer((_) async => (await mockApiService.getCountries()).fold(
              (failure) => Left(failure),
              (data) => Right(data
                  .map((e) => CountryModel.fromJson(e).toEntity())
                  .toList()),
            ));

    final result = await mockCountriesRepoImpl.getCountries();

    result.fold(
      (failure) => fail('Expected success but got failure: $failure'),
      (countries) {
        expect(countries, isA<List<CountryEntity>>());
        expect(countries, isNotEmpty);
        expect(countries.first.name, "افغانستان");
      },
    );
  });
}
