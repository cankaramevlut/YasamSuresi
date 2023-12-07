import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:yasambeklentisi/constants.dart';
import 'package:yasambeklentisi/result_page.dart';
import 'package:yasambeklentisi/user_data.dart';

import 'cinsiyet_secim.dart';
import 'container_secim.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170;
  int kilo = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    renk: Colors.lightGreenAccent,
                    child: buildRowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    renk: Colors.lightGreenAccent,
                    child: buildRowOutlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              renk: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Haftada Kaç Gün Spor Yaparsınız?", style: metinStil),
                  Text(sporGunu.round().toString(), style: sayiStil),
                  Slider(
                    min: 0,
                    max: 7,
                    value: sporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              renk: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Günde Kaç Adet Sigara İçersin?", style: metinStil),
                  Text(icilenSigara.round().toString(), style: sayiStil),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN"
                          ? Colors.pinkAccent
                          : Colors.lightGreenAccent,
                      child: Kadinerkek(
                          cinsiyet: "KADIN", sekil: FontAwesome.venus)),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.lightBlueAccent
                        : Colors.lightGreenAccent,
                    child: Kadinerkek(
                      cinsiyet: "ERKEK",
                      sekil: FontAwesome.mars,
                    ),
                  ),
                )
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              sporGunu: sporGunu,
                              icilenSigara: icilenSigara,
                            ))));
              },
              child: Text(
                "HESAPLA",
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
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == "BOY" ? boy.toString() : kilo.toString(),
              style: sayiStil,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesome5Solid.icons)),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesome5Solid.icons))
          ],
        )
      ],
    );
  }
}
