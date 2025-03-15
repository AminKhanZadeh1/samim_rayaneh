import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:samim_rayaneh/Config/API/api_config.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Repository/countries_repo_impl.dart';
import 'package:samim_rayaneh/Features/Countries/Data/Source/Remote/countries_api_service.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Repository/countries_repo.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/Blocs/country_bloc/country_bloc.dart';

final GetIt locator = GetIt.instance;

setup() {
  locator.registerLazySingleton<Dio>(() => ApiConfig.createDio());

  locator.registerLazySingleton<CountriesApiService>(
      () => CountriesApiService(dio: locator<Dio>()));

  locator.registerLazySingleton<CountriesRepo>(
    () => CountriesRepoImpl(apiService: locator<CountriesApiService>()),
  );

  locator.registerLazySingleton(
    () => CountryBloc(locator()),
  );
}
