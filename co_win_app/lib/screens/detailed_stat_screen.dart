import 'package:co_win_app/screens/cities_screen.dart';
import 'package:co_win_app/services/api.dart';
import 'package:co_win_app/services/state_stat_model.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kRedColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Patients all over India",
              style: titlelabelStyle.copyWith(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stateList() {
    return FutureBuilder<List<StateStatModel>>(
      future: ApiManager().getStateStat(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.67,
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CitiesScreen(
                                    districtData:
                                        snapshot.data[index].districtData,
                                  )),
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
                                  snapshot.data[index].state,
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
