import 'package:co_win_app/shared/colors.dart';
import 'package:co_win_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: containerColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Covid-19\n',
                              style: titlelabelStyle.copyWith(
                                  color: Colors.white, fontSize: 25)),
                          TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(
                              text: 'Are you feeling sick?\n',
                              style: titlelabelStyle.copyWith(
                                  color: Colors.white)),
                          TextSpan(text: '\n'),
                          TextSpan(
                              text:
                                  'If you feel sick with any of the symptoms of covid-19 please call on teh number below',
                              style: subtitlelabelStyle.copyWith(
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                _callButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                    _statCard("Total Cases", "assets/bacteria.svg", "4465454"),
                    _statCard("Total Deaths", "assets/skeleton.svg", "445464"),
                    _statCard("Total cases in India", "assets/patient.svg",
                        "4564564"),
                    _statCard("Total Cured", "assets/plant.svg", "456151")
                  ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Preventions",
                style: titlelabelStyle.copyWith(fontSize: 20)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _prevention("assets/queue.svg", "Keep Distance"),
              _prevention("assets/mask.svg", "Wear Masks"),
              _prevention("assets/hands.svg", "sanitize your hands"),
            ],
          )
        ],
      ),
    );
  }

  Widget _statCard(String attribute, String asset, String stat) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.05,
              child: SvgPicture.asset(asset)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                attribute,
                style: titlelabelStyle,
              ),
              Text(
                stat,
                style: subtitlelabelStyle,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _callButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call),
              Text(
                "Call Now",
                style: subtitlelabelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _prevention(String asset, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.2,
              child: SvgPicture.asset(asset)),
          Text(text, style: subtitlelabelStyle),
        ],
      ),
    );
  }
}
