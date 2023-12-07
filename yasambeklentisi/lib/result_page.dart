import 'package:flutter/material.dart';
import 'package:yasambeklentisi/constants.dart';
import 'package:yasambeklentisi/hesap.dart';
import 'package:yasambeklentisi/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Mevlüt Beyin Verilerine Göre ",
          style: metinStil,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${Hesap(_userData).hesaplama().toString()}",
                    style: metinStil,
                  ),
                  SizedBox(height: 30), // Araya bir boşluk ekledik
                  Text(
                    "Şaka Şaka O Kadar Yaşamazsın ",
                    style: metinStil,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(
                      5.0), // Adjust the elevation value as needed
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightGreenAccent),
                ),
              ))
        ],
      ),
    );
  }
}
