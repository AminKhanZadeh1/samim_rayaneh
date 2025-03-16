import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final String capital;
  final String code;
  final String flag;

  const CountryEntity(
      {required this.name,
      required this.capital,
      required this.code,
      required this.flag});

  CountryEntity toEntity() {
    return CountryEntity(name: name, capital: capital, code: code, flag: flag);
  }

  @override
  List<Object?> get props => [name, capital, code, flag];
}
