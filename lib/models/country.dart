import 'package:countries/models/currency.dart';

class Country {
  final String countryName;
  final int population;
  final String region;
  final String capital;
  final String flag;
  final String nativeName;
  final String subregion;
  final List<String> topLevelDomain;
  final List<Currency> currency;

  Country({
    required this.countryName,
    required this.population,
    required this.region,
    required this.capital,
    required this.flag,
    required this.nativeName,
    required this.subregion,
    required this.currency,
    required this.topLevelDomain,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var jsonCurrency = json['currencies'] as List;
    var jsonTopLevelDomain = json['topLevelDomain'] as List;

    List<Currency> currencyList =
        jsonCurrency.map((e) => Currency.fromJson(e)).toList();

    List<String> _topLevelDomain = List<String>.from(jsonTopLevelDomain);

    return Country(
      countryName: json['name'],
      population: json['population'],
      region: json['region'],
      capital: json['capital'],
      flag: json['flag'],
      nativeName: json['nativeName'],
      subregion: json['subregion'],
      topLevelDomain: _topLevelDomain,
      currency: currencyList,
    );
  }

  @override
  String toString() {
    return super.toString();
  }
}
