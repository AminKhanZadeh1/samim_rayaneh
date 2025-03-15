import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel(
      {required super.name,
      required super.capital,
      required super.code,
      required super.flag});

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      name: json['name'],
      capital: json['capital'],
      code: json['code'],
      flag: json['flag']);
}
