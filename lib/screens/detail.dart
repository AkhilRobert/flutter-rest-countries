import 'package:flutter/material.dart';

class DetailArguments {
  final String countryName;

  DetailArguments({required this.countryName});
}

class Detail extends StatelessWidget {
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.countryName,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("This is the detail screen for ${args.countryName}"),
      ),
    );
  }
}
