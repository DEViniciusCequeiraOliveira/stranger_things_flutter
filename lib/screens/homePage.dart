import 'package:flutter/material.dart';
import 'package:stranger_things/components/DialogError.dart';
import 'package:stranger_things/components/ListViewCharacter.dart';
import 'package:stranger_things/components/ListViewSeason.dart';
import 'package:stranger_things/components/ListViewYoutube.dart';
import 'package:stranger_things/components/LoadingComponents.dart';
import 'package:stranger_things/components/MaxQueriesComponents.dart';
import 'package:stranger_things/components/TitleSection.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:stranger_things/repository/apiSeasons.dart';
import 'package:stranger_things/repository/apiStrangerThings.dart';
import 'package:stranger_things/repository/apiYoutube.dart';


class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              TitleSection(titleName: "Videos"),
              Container(
                height: size.height * 0.4,
                child: FutureBuilder(
                  future: apiYoutube().fetch(),
                  builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasError) {
                      return DialogError();
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return MaxQueriesComponents();
                      }
                      return ListViewYoutube(snapshot: snapshot);
                    }
                    return LoadingComponents();
                  },
                ),
              ),
              TitleSection(titleName: "Personagens"),
              Container(
                height: size.height * 0.4,
                child: FutureBuilder(
                  future: apiStrangerThings().fetch(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Character>> snapshot) {
                    if (snapshot.hasError) {
                      return DialogError();
                    }

                    if (snapshot.hasData) {
                      return ListViewCharacter(snapshot: snapshot);
                    }
                    return LoadingComponents();
                  },
                ),
              ),
              TitleSection(titleName: "Temporadas"),
              Container(
                height: size.height * 0.4,
                child: FutureBuilder(
                  future: apiSeasons().fetch(),
                  builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasError) {
                      return DialogError();
                    }
                    if (snapshot.hasData) {
                      return ListViewSeason(snapshot: snapshot);
                    }
                    return LoadingComponents();
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
