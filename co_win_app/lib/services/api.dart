import 'dart:io';

import 'package:co_win_app/services/state_stat_model.dart';
import 'package:co_win_app/services/stats_model.dart';
import 'package:co_win_app/services/vaccine_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<StatsModel> getStat() async {
    String url = "https://api.rootnet.in/covid19-in/stats/latest";

    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final stat = statsModelFromJson(jsonString.toString());
        return stat;
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return null;
  }

  Future<List<StateStatModel>> getStateStat() async {
    String url = "https://api.covid19india.org/v2/state_district_wise.json";

    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final stateStateModel = stateStatModelFromJson(jsonString.toString());
        return stateStateModel;
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return null;
  }

  Future<VaccineModel> vaccineDetailGetter() async {
    String url =
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=400052&date=31-05-2021";

    var response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',
    });
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final vaccineModel = vaccineModelFromJson(jsonString.toString());
        return vaccineModel;
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return null;
  }
}
