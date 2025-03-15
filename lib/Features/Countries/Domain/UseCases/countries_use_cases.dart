import 'package:dartz/dartz.dart';
import 'package:samim_rayaneh/Core/Failures/handle_dio_error.dart';
import 'package:samim_rayaneh/Core/Utils/Params/use_case_params.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Repository/countries_repo.dart';

class FetchCountriesUseCase
    extends UseCase<Either<Failure, List<CountryEntity>>, void> {
  final CountriesRepo _countriesRepo;

  FetchCountriesUseCase(this._countriesRepo);
  @override
  Future<Either<Failure, List<CountryEntity>>> call(void params) async {
    return await _countriesRepo.getCountries();
  }
}
