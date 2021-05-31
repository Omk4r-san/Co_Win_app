import 'package:co_win_app/screens/detail_screen.dart';
import 'package:co_win_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicons/unicons.dart';

class CitiesScreen extends StatefulWidget {
  final List districtData;

  CitiesScreen({Key key, this.districtData}) : super(key: key);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text("All Cities", style: titlelabelStyle.copyWith(fontSize: 20)),
        ),
        _cityList()
      ],
    ));
  }

  Widget _cityList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      child: ListView.builder(
          itemCount: widget.districtData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Column(
                  children: [
                    Text(
                      widget.districtData[index].district,
                      style: titlelabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _statCard(
                          "assets/bacteria.svg",
                          "Active",
                          widget.districtData[index].active.toString(),
                        ),
                        _statCard(
                          "assets/skeleton.svg",
                          "Deaths",
                          widget.districtData[index].deceased.toString(),
                        ),
                        _statCard(
                          "assets/patient.svg",
                          "Confirmed",
                          widget.districtData[index].confirmed.toString(),
                        ),
                        _statCard("assets/plant.svg", "Recovered",
                            widget.districtData[index].recovered.toString())
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _statCard(String asset, String stat, String value) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.05,
            child: SvgPicture.asset(asset)),
        Text(
          stat,
          style: subtitlelabelStyle,
        ),
        Text(
          value,
          style: titlelabelStyle,
        )
      ],
    );
  }
}
