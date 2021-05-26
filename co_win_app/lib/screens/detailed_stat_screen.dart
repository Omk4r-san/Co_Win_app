import 'package:co_win_app/screens/cities_screen.dart';
import 'package:co_win_app/shared/colors.dart';
import 'package:co_win_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class DetailedStat extends StatefulWidget {
  DetailedStat({Key key}) : super(key: key);

  @override
  _DetailedStatState createState() => _DetailedStatState();
}

class _DetailedStatState extends State<DetailedStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.94,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            _topCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All States",
                  style: titlelabelStyle.copyWith(fontSize: 20),
                ),
              ),
            ),
            _stateList()
          ],
        ),
      ),
    );
  }

  Widget _topCard() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kRedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Patients all over India",
            style: titlelabelStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _stateList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.61,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CitiesScreen()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "state",
                            style: subtitlelabelStyle,
                          ),
                          Icon(UniconsLine.angle_right)
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
