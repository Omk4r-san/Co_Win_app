import 'package:co_win_app/services/stats_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<StatsModel> getNews() async {
    String url = "https://api.rootnet.in/covid19-in/stats/latest";

    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final topNews = statsModelFromJson(jsonString.toString());
        return topNews;
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return null;
  }
}
