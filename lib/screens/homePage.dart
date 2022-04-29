import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:http/http.dart' as http;
import 'package:stranger_things/repository/apiStrangerThings.dart';
import 'package:stranger_things/screens/CharacterPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({
    Key? key,
  }) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png",
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
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Personagens",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
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
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterPage(index: index)));
                                },
                                splashColor: Colors.white10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    snapshot.data![index].photo.toString(),
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
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
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}