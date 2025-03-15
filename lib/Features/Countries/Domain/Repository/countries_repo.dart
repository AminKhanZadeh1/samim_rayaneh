import 'package:dartz/dartz.dart';
import 'package:samim_rayaneh/Core/Failures/handle_dio_error.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';

abstract class CountriesRepo {
  Future<Either<Failure, List<CountryEntity>>> getCountries();
}
