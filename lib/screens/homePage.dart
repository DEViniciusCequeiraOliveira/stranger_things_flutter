import 'package:flutter/material.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:stranger_things/repository/apiSeasons.dart';
import 'package:stranger_things/repository/apiStrangerThings.dart';
import 'package:stranger_things/repository/apiYoutube.dart';
import 'package:stranger_things/screens/CharacterPage.dart';
import 'package:stranger_things/screens/SeasonPage.dart';
import 'package:stranger_things/screens/videoPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Videos",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: FutureBuilder(
                  future: apiYoutube().fetch(),
                  builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("ERRO"),
                      );
                    }
                    if (snapshot.hasData) {
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
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
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
                        /*                        if (index > snapshot.data!.length) {
                            return Container(
                              color: Colors.white,
                              width: 40,
                              child: Text(
                                "oi",
                                style: TextStyle(color: Colors.amber),
                              ),
                            );
                          } */
                      );
                    }
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black,
                        child: AlertDialog(
                          backgroundColor: Colors.black,
                          content: Container(
                            child: Image.network(
                                "https://giffiles.alphacoders.com/156/15671.gif"),
                            width: 300,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Personagens",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: FutureBuilder(
                  future: apiStrangerThings().fetch(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Character>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Erro"),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CharacterPage(index: index))),
                                splashColor: Colors.white10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    snapshot.data![index].photo.toString(),
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.29,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data![index].name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }

                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black,
                        child: AlertDialog(
                          backgroundColor: Colors.black,
                          content: Container(
                            child: Image.network(
                                "https://giffiles.alphacoders.com/156/15671.gif"),
                            width: 300,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Temporadas",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: FutureBuilder(
                  future: apiSeasons().fetch(),
                  builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SeasonPage(index: index),
                                  ),
                                ),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${snapshot.data![index]["poster_path"].toString()}",
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                              Text(snapshot.data![index]["name"].toString())
                            ]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 16,
                            );
                          },
                          itemCount: snapshot.data!.length);
                    }
                    return Text("NADA");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
