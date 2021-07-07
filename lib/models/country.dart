class Country {
  final String countryName;
  final int population;
  final String region;
  final String capital;
  final String flag;

  Country({
    required this.countryName,
    required this.population,
    required this.region,
    required this.capital,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryName: json['name'],
      population: json['population'],
      region: json['region'],
      capital: json['capital'],
      flag: json['flag'],
    );
  }
}
