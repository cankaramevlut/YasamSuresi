import 'package:flutter/material.dart';

import 'constants.dart';

class Kadinerkek extends StatelessWidget {
  final IconData sekil;
  final String cinsiyet;

  Kadinerkek({required this.sekil, required this.cinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          sekil,
          size: 60,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(cinsiyet, style: metinStil),
      ],
    );
  }
}
