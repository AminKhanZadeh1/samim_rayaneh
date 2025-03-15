import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samim_rayaneh/Config/Theme/theme.dart';
import 'package:samim_rayaneh/Core/DI/locator.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/Blocs/country_bloc/country_bloc.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/View/countries_screen.dart';

void main() async {
  await setup();
  runApp(BlocProvider(
    create: (context) => CountryBloc(locator())..add(FetchCountriesEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: CountriesScreen(),
      locale: Locale('Fa'),
    );
  }
}
