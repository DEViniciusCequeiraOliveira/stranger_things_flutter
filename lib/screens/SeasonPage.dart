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
    Size size = MediaQuery.of(context).size;

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
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Image.network(
                            "https://image.tmdb.org/t/p/w500${contents["episodes"][i]["still_path"].toString()}",
                            fit: BoxFit.cover,
                            //height: MediaQuery.of(context).size.height * 0.45,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TitleStyleView(
                                    characteristic: contents["episodes"][i]
                                            ["name"]
                                        .toString()),
                                Container(
                                  padding: EdgeInsets.all(18),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${(contents["episodes"][i]["vote_average"] / 2).toStringAsFixed(2)}",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            RatingBarIndicator(
                                              rating: contents["episodes"][i]
                                                      ["vote_average"] /
                                                  2,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              unratedColor: Colors.white,
                                              itemSize: 18,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 65,
                                          width: 30,
                                          child: VerticalDivider(
                                            color: Colors.red,
                                            thickness: 3,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("TOTAL DE VOTOS",
                                                style: TextStyle(fontSize: 18)),
                                            Text(
                                                "${contents["episodes"][i]["vote_count"]}")
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 65,
                                          width: 30,
                                          child: VerticalDivider(
                                            color: Colors.red,
                                            thickness: 3,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("MINUTOS",
                                                style: TextStyle(fontSize: 18)),
                                            Text(
                                                "${contents["episodes"][i]["runtime"]}")
                                          ],
                                        ),
                                      ],
                                    ),
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
                        ]),
                        /*  TextStyleView(
                                characteristic: contents["episodes"][i]
                                    ["vote_average"]) */
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
