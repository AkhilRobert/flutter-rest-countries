import 'package:countries/models/country.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class DetailArguments {
  final Country country;

  DetailArguments({required this.country});
}

class Detail extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
    Country country = args.country;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.countryName,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: Colors.deepOrange,
              child: ScalableImageWidget.fromSISource(
                si: ScalableImageSource.fromSvgHttpUrl(
                  Uri.parse(country.flag),
                ),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              country.countryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Native name:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.nativeName)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Population:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.population.toString())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Region:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.region)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Sub Region:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.subregion)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Capital:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.capital)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Top Level Domain:  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(country.topLevelDomain.join(" "))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
