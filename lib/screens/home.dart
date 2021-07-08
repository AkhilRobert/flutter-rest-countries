import 'package:countries/components/country_card.dart';
import 'package:countries/models/country.dart';
import 'package:countries/service/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Country>> _countries;

  @override
  void initState() {
    super.initState();
    _countries = fetchCountries();
  }

  Widget countryList() {
    return FutureBuilder<List<Country>>(
      future: _countries,
      builder: (ctx, snap) {
        if (snap.hasData) {
          var data = snap.data;

          if (data == null) {
            print("Data is null");

            return Center(
              child: Text("No data "),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, idx) {
              return CountryCard(
                countryName: data[idx].countryName,
                popluation: data[idx].population,
                capital: data[idx].capital,
                region: data[idx].region,
                flag: data[idx].flag,
              );
            },
          );
        } else if (snap.hasError) {
          var msg = snap.error.toString();
          print(msg);
          return Text(msg);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Where in the world ?",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: countryList(),
    );
  }
}
