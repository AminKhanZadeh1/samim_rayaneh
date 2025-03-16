part of 'country_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

class CountriesLoadingState extends CountryState {}

class CountriesLoadedState extends CountryState {
  final List<CountryEntity> countries;

  const CountriesLoadedState(this.countries);
}

class ErrorFetchingState extends CountryState {
  final String message;

  const ErrorFetchingState(this.message);
}
