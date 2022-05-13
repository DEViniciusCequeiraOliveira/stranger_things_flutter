import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stranger_things/components/TitleStyleView.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stranger_things/repository/apiSeasons.dart';

class SeasonPage extends StatelessWidget {
  const SeasonPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: apiSeasons().fetch(),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final contents = snapshot.data![index];

                return PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Image.network(
                            "https://image.tmdb.org/t/p/w500${contents["episodes"][i]["still_path"].toString()}",
                            fit: BoxFit.cover,
                            //height: MediaQuery.of(context).size.height * 0.45,
                          ),
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                TitleStyleView(
                                    characteristic: contents["episodes"][i]
                                            ["name"]
                                        .toString()),
                                Container(
                                  //margin: EdgeInsets.only(top: 25, bottom: 8),
                                  padding: EdgeInsets.all(18),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${(contents["episodes"][i]["vote_average"] / 2).toStringAsFixed(2)}"),
                                          RatingBarIndicator(
                                            rating: contents["episodes"][i]
                                                    ["vote_average"] /
                                                2,
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemSize: 18,
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(
                                        color: Colors.red,
                                        thickness: 1.6,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("TOTAL DE VOTOS"),
                                          Text(
                                              "${contents["episodes"][i]["vote_count"]}")
                                        ],
                                      ),
                                      VerticalDivider(
                                        color: Colors.red,
                                        thickness: 1.6,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("MINUTOS"),
                                          Text(
                                              "${contents["episodes"][i]["runtime"]}")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${contents["episodes"][i]["overview"]}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  //TextStyleView(characteristic: contents["episodes"][i]["overview"].toString()),
                                ),
                              ],
                            ),
                          ),
                          /*  TextStyleView(
                              characteristic: contents["episodes"][i]
                                  ["vote_average"]) */
                        ],
                      ),
                    );
                  },
                );
              }
              return Text("data");
            },
          ),
        )
      ]),
    );
  }
}
