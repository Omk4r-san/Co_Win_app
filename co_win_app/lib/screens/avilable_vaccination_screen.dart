import 'package:co_win_app/services/api.dart';
import 'package:co_win_app/services/vaccine_model.dart';
import 'package:flutter/material.dart';

class AvailableVaccinesScreens extends StatefulWidget {
  final String pincode;
  AvailableVaccinesScreens({Key key, this.pincode}) : super(key: key);

  @override
  _AvailableVaccinesScreensState createState() =>
      _AvailableVaccinesScreensState();
}

class _AvailableVaccinesScreensState extends State<AvailableVaccinesScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<VaccineModel>(
      future: ApiManager().vaccineDetailGetter(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print("this" + snapshot.data.sessions[1].address.toString());
          return _mainPage(snapshot.data.sessions[1].address);
        }
        print("nahi mila");
        return Center(child: CircularProgressIndicator());
      },
    ));
  }

  Widget _mainPage(var snapshot) {
    return Center(child: Text(snapshot));
  }
}
