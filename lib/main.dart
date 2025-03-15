import 'package:flutter/material.dart';
import 'package:samim_rayaneh/Config/Theme/theme.dart';
import 'package:samim_rayaneh/Core/DI/locator.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/View/countries_screen.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: CountriesScreen(),
    );
  }
}
