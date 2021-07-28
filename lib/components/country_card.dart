import 'package:countries/models/country.dart';
import 'package:countries/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jovial_svg/jovial_svg.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({required this.country});

  String _formatNumber(int number) {
    var f = NumberFormat("##,###", "en_US");
    return f.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Detail.routeName,
              arguments: DetailArguments(country: country),
            );
          },
          child: Column(
            children: [
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: ScalableImageWidget.fromSISource(
                    si: ScalableImageSource.fromSvgHttpUrl(
                      Uri.parse(country.flag),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(36),
                // color: Colors.red,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        country.countryName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Text(
                              "Population:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(_formatNumber(country.population))
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Text(
                              "Region:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(country.region)
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Text(
                              "Capital:",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(country.capital)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
