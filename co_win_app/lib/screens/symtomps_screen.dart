import 'package:co_win_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SymtompsScreen extends StatefulWidget {
  SymtompsScreen({Key key}) : super(key: key);

  @override
  _SymtompsScreenState createState() => _SymtompsScreenState();
}

class _SymtompsScreenState extends State<SymtompsScreen> {
  List<String> icons = [
    "breathing.svg",
    "cough.svg",
    "diarrhea.svg",
    "dizziness.svg",
    "fever.svg",
    "headache.svg",
    "sneezing.svg",
    "sore.svg",
    "taste.svg",
    "vomit.svg",
  ];
  List<String> symptom = [
    "Shortness of Breathing",
    "Cough",
    "Diarrhea",
    "Dizziness",
    "Fever",
    "Headache",
    "Sneezing",
    "Sore Throat",
    "Loss of Sense of taste",
    "Vomiting",
  ];
  List<Color> backgroundColor = [
    Color(0xfffd5dbb3),
    Color(0xfff4aa96c),
    Color(0xfffca8a8b),
    Color(0xffffdbaf8),
    Color(0xfff289672),
    Color(0xfffffe268),
    Color(0xfff9ede73),
    Color(0xfffef4f4f),
    Color(0xfffeb596e),
    Color(0xfff91c788),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.redAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Danger!!",
                      style: titlelabelStyle.copyWith(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "If suffering from any of the symtomps please contact the nearest hospital",
                      style: subtitlelabelStyle.copyWith(
                          color: Colors.white, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _cardList()
        ],
      ),
    );
  }

  Widget _cardList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
          itemCount: symptom.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: backgroundColor[index]),
                  child: Center(
                    child: ListTile(
                      leading: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: SvgPicture.asset("assets/" + icons[index])),
                      title: Text(
                        symptom[index],
                        style: subtitlelabelStyle.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
