import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samim_rayaneh/Features/Countries/Domain/Entities/country_entity.dart';
import 'package:samim_rayaneh/Features/Countries/Presentation/Blocs/country_bloc/country_bloc.dart';

class CountriesListView extends StatelessWidget {
  final CountriesLoadedState state;
  const CountriesListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 130,
      padding: EdgeInsets.symmetric(horizontal: 5),
      itemCount: state.countries.length,
      itemBuilder: (context, index) {
        CountryEntity item = state.countries[index];
        return Center(
          child: ListTile(
            contentPadding: EdgeInsets.all(30),
            onTap: () {},
            leading: CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl: item.flag,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            title: Text(
              "نام: ${item.name}",
              style: TextStyle(fontSize: 12),
            ),
            trailing: Text(
              'پایتخت: ${item.capital}',
              style: TextStyle(fontSize: 11),
            ),
          ),
        );
      },
    );
  }
}
