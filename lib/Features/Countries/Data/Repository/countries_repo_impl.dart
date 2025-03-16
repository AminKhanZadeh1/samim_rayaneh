import 'package:dartz/dartz.dart';
import 'package:samim_rayaneh/Core/Failures/handle_dio_error.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Models/country_model.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Source/Remote/countries_api_service.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Repository/countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final CountriesApiService apiService;

  CountriesRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountries() async {
    final response = await apiService.getCountries();

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final countries =
              data.map((e) => CountryModel.fromJson(e).toEntity()).toList();
          return Right(countries);
        } catch (e) {
          return Left(UnknownFailure('Failed to parse countries data'));
        }
      },
    );
  }
}
