import 'dart:convert';
import 'package:stranger_things/constants/keyYoutube.dart';
import 'package:http/http.dart' as http;

class apiYoutube {
  List<Map<String, String>> listaInfoVideo = [];
  var dados = new Map();

  Future<List<Map>> fetch() async {
    var url = Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/channelSections?part=contentDetails&channelId=UChmpTxQ0Gp8KEJKsqzeg9Lg&key=${keyYoutube.apiYoutube}");
    var response = await http.get(url);
    print("object");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (int i = 0; i < 2; i++) {
        await video(json["items"][i]["contentDetails"]["playlists"]
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", ""));
        print(listaInfoVideo);
      }
      // print(listaIdVideo);
      //print(dados);

      return listaInfoVideo;
    } else {
      return [];
    }
  }

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
        //dados["idVideo"] = json["items"][i]["contentDetails"]["videoId"].toString();
        //dados["titleVideo"] = json["items"][i]["snippet"]["title"].toString();
        print(dados);

        //listaIdVideo.add(dados);
        listaInfoVideo.add(
          {
            "idVideo": json["items"][i]["contentDetails"]["videoId"].toString(),
            "titleVideo": json["items"][i]["snippet"]["title"].toString(),
            "thumbnail": json["items"][i]["snippet"]["thumbnails"]["maxres"]
                    ["url"]
                .toString(),
          },
        );
      }
    }
  }
}
