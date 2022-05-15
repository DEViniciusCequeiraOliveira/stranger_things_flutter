import 'package:flutter/material.dart';
import 'package:stranger_things/screens/videoPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListViewYoutube extends StatelessWidget {
  const ListViewYoutube({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 16,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        String idVideo = snapshot.data![index]["idVideo"];
        return Center(
          child: Column(
            children: [
              InkWell(
                child: Image.network(
                  YoutubePlayer.getThumbnail(
                    videoId: (idVideo),
                    quality: ThumbnailQuality.high,
                  ),
                  fit: BoxFit.cover,
                  width: size.width * 0.65,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => videoPage(
                      idVideo: idVideo,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.65,
                child: Text(
                  snapshot.data![index]["titleVideo"],
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
