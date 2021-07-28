import 'package:countries/models/country.dart';
import 'package:flutter/material.dart';

class DetailArguments {
  final Country country;

  DetailArguments({required this.country});
}

class Detail extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.country.nativeName,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("This is the detail screen for ${args.country.nativeName}"),
      ),
    );
  }
}
