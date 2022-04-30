import 'package:flutter/material.dart';
import 'package:stranger_things/components/TextStyleView.dart';
import 'package:stranger_things/components/TitleStyleView.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:stranger_things/repository/apiStrangerThings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key, required this.index}) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height,
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
                final contents = snapshot.data![index];
                return Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          snapshot.data![index].photo.toString(),
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.60,
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleStyleView(
                                  characteristic: contents.name,
                                ),
                                TextStyleView(characteristic: contents.aliases),
                                TextStyleView(
                                  characteristic: contents.occupation,
                                  icon: FaIcon(
                                    FontAwesomeIcons.briefcase,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                ),
                                TextStyleView(
                                    characteristic: contents.affiliation),
                                TextStyleView(
                                    characteristic: contents.appearsInEpisodes),
                                TextStyleView(
                                    characteristic: contents.otherRelations),
                                TextStyleView(
                                    characteristic: contents.residence),
                                TextStyleView(characteristic: contents.status),
                                TextStyleView(
                                    characteristic: contents.portrayedBy)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }

              return Center(
                child: Container(
                  color: Colors.black,
                  child: AlertDialog(
                    backgroundColor: Colors.black,
                    content: Container(
                      child: Image.network(
                          "https://giffiles.alphacoders.com/156/15671.gif"),
                      width: 100,
                    ),
                  ),
                ),
                /*child: CircularProgressIndicator(),*/
              );
            },
          ),
        )
      ]),
    );
  }
}
