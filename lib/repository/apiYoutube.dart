import 'dart:convert';
import 'package:stranger_things/constants/keyYoutube.dart';
import 'package:http/http.dart' as http;

class apiYoutube {
  List<Map<String, String>> listaInfoVideo = [];

  Future<List<Map>> fetch() async {
    var url = Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UChmpTxQ0Gp8KEJKsqzeg9Lg&maxResults=7&key=${keyYoutube.apiYoutube}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (int i = 0; i < 7; i++) {
        String idVideo = json["items"][i]["id"]["videoId"].toString();
        String title = json["items"][i]["snippet"]["title"].toString();
        listaInfoVideo.add({"idVideo": idVideo, "titleVideo": title});
      }
      return listaInfoVideo;
    }
    return [];
  }
/*
  Future<List<Map>> fetch() async {
    var url = Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/channelSections?part=contentDetails&channelId=UChmpTxQ0Gp8KEJKsqzeg9Lg&key=${keyYoutube.apiYoutube}");
    var response = await http.get(url);
    print("object");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (int i = 0; i < 9; i++) {
        await video(json["items"][i]["contentDetails"]["playlists"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", ""));
        print(listaInfoVideo);
      }
      // print(listaIdVideo);
      //print(dados);
      //print(listaInfoVideo.sublist(start))

      //print(listaInfoVideo.sublist(start + (cont++ * end),end + end * cont++));
      //return listaInfoVideo.sublist(start + (cont++ * end),end + end * cont++);

      return listaInfoVideo;
    } else {
      return [];
    }
  } */
  /*
  Future video(String id) async {
    var url = Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails&part=snippet&maxResults=50&playlistId=${id}&key=${keyYoutube.apiYoutube}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("vem");
      print(json["pageInfo"]["totalResults"]);
      int x = json["pageInfo"]["totalResults"];
      for (int i = 0; i < x; i++) {
        String title = json["items"][i]["snippet"]["title"].toString();
        String idVideo =
            json["items"][i]["contentDetails"]["videoId"].toString();

        if (title != "Private video") {
          listaInfoVideo.add(
            {"idVideo": idVideo, "titleVideo": title},
          );
        }
      }
    }
  } */
}
