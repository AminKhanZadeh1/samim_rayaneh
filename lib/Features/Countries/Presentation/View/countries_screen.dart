import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/Blocs/country_bloc/country_bloc.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/Widgets/countries_list_view.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('لیست کشور ها'),
          scrolledUnderElevation: 0,
        ),
        body: Center(
          child: BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              if (state is CountriesLoadingState) {
                return CircularProgressIndicator();
              }
              if (state is ErrorFetchingState) {
                return Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          child: Text(
                            'تلاش مجدد',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          onPressed: () => context
                              .read<CountryBloc>()
                              .add(FetchCountriesEvent())),
                    )
                  ],
                );
              } else if (state is CountriesLoadedState) {
                return CountriesListView(
                  state: state,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ));
  }
}
