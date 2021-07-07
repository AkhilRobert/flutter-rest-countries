import 'package:countries/components/country_card.dart';
import 'package:countries/models/country.dart';
import 'package:countries/service/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Iterable<Country>> _countries;

  @override
  void initState() {
    super.initState();
    _countries = fetchCountries();
  }

  Widget countryList() {
    return FutureBuilder(
      future: _countries,
      builder: (BuildContext ctx, AsyncSnapshot<Iterable<Country>> snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snap.hasData) {
          // If we got the data
          var data = snap.data!.toList();

          return ListView.builder(
            itemCount: snap.data!.length,
            itemBuilder: (ctx, index) {
              return CountryCard(
                countryName: data[index].countryName,
                popluation: data[index].population,
                capital: data[index].capital,
                region: data[index].region,
                flag: data[index].flag,
              );
            },
          );
        } else {
          return Text("data");
        }
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
