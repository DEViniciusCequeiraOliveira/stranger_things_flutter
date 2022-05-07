import 'package:flutter/material.dart';
import 'package:stranger_things/components/TextStyleView.dart';
import 'package:stranger_things/components/TitleStyleView.dart';

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
                          TitleStyleView(
                              characteristic:
                                  contents["episodes"][i]["name"].toString()),
                          TextStyleView(
                              characteristic: contents["episodes"][i]
                                      ["overview"]
                                  .toString())
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
