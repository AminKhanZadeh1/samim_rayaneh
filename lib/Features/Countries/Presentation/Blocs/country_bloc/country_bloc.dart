import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samim_rayaneh/Core/Failures/handle_dio_error.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Repository/countries_repo.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/UseCases/countries_use_cases.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountriesRepo _countriesRepo;
  final FetchCountriesUseCase _fetchCountriesUseCase;
  CountryBloc(this._countriesRepo, this._fetchCountriesUseCase)
      : super(CountryInitial()) {
    on<CountryEvent>((event, emit) async {
      if (event is FetchCountriesEvent) {
        emit(CountriesLoadingState());

        final result = await _fetchCountriesUseCase(_countriesRepo);

        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              emit(ErrorFetchingState('اتصال شبکه را بررسی کنید'));
            } else if (failure is TimeoutFailure) {
              emit(ErrorFetchingState('!پایان زمان درخواست'));
            } else if (failure is ServerFailure) {
              emit(ErrorFetchingState(failure.message));
            } else {
              emit(ErrorFetchingState('خطا در دریافت اطلاعات'));
            }
          },
          (countries) => emit(CountriesLoadedState(countries)),
        );
      }
    });
  }
}
