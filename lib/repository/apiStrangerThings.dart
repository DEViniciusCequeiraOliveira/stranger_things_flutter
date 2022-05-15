import 'dart:convert';
import 'package:stranger_things/models/Character.dart';
import 'package:http/http.dart' as http;

class apiStrangerThings {
  Future<List<Character>> fetch() async {
    var url =
        Uri.parse('http://stranger-things-api.herokuapp.com/api/v1/characters');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json.map<Character>((resp) => Character.fromJson(resp)).toList();
    } else {
      throw Exception("ERRO");
    }
  }
}
