import 'dart:convert';

import 'package:countries/models/country.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Country>> fetchCountries() async {
  final response =
      await http.get(Uri.parse("https://restcountries.eu/rest/v2/all"));

  if (response.statusCode != 200) {
    throw Exception("Failed to load countries data");
  }

  var data = json.decode(response.body) as List;
  var countries = data.map((e) => Country.fromJson(e));

  return countries;
}
