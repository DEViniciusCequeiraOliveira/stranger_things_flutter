import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stranger_things/components/LoadingComponents.dart';
import 'package:stranger_things/components/TextStyleSimpleView.dart';
import 'package:stranger_things/components/TitleSection.dart';
import 'package:stranger_things/components/TitleStyleView.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stranger_things/models/Seasons.dart';
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
            builder: (context, AsyncSnapshot<List<Seasons>> snapshot) {
              if (snapshot.hasData) {
                final contents = snapshot.data![index];

                //final contentsCharacter = snapshot.data![index]["episodes"][""];

                return PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contents.episodes!.length,
                  itemBuilder: (context, i) {
                    return Container(
                      color: Colors.black,
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: Colors.black,
                            expandedHeight: size.height * 0.32,
                            pinned: false,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Image.network(
                                "https://image.tmdb.org/t/p/w500${contents.episodes![i].stillPath}",
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                      child: Image.asset("assets/splash.gif"));
                                },
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleStyleView(
                                      characteristic: contents.episodes![i].name
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
                                                "${(contents.episodes![i].voteAverage! / 2).toStringAsFixed(2)}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              RatingBarIndicator(
                                                rating: contents.episodes![i]
                                                        .voteAverage! /
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
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text(
                                                  "${contents.episodes![i].voteCount}")
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
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Text(
                                                  "${contents.episodes![i].runtime}")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "${contents.episodes![i].overview}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  TitleSection(titleName: "Atores"),
                                  Container(
                                    height: size.height * 0.5,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: contents
                                          .episodes![i].guestStars!.length,
                                      itemBuilder: (context, ind) {
                                        final contentsPerson = contents
                                            .episodes![i].guestStars![ind];
                                        return Column(
                                          children: [
                                            Image.network(
                                              contentsPerson.profilePath != null
                                                  ? "https://image.tmdb.org/t/p/w500${contentsPerson.profilePath}"
                                                  : "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
                                              height: size.height *0.4,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              contentsPerson.character
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20, color: Colors.red
                                              ),
                                              
                                            ),
                                            TextStyleSimpleView(characteristic: contentsPerson.name)
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 10,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return LoadingComponents();
            },
          ),
        )
      ]),
    );
  }
}
