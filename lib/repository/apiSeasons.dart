import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stranger_things/constants/keyTMDA.dart';

class apiSeasons {
  List seasons = [1, 2, 3];
  List<Map<String, dynamic>> dateSeasons = [];

  Future<List<Map<String, dynamic>>> fetch() async {
    for (int season in seasons) {

      var url = Uri.parse(
          "https://api.themoviedb.org/3/tv/66732/season/$season?api_key=${keyTMDA.apikeyTMDA}&language=pt-BR");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        dateSeasons.add(json);
      }
    }
    return dateSeasons;
  }
}
