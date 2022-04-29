import 'package:flutter/material.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:stranger_things/repository/apiStrangerThings.dart';

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
                return Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          snapshot.data![index].photo.toString(),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.68,
                        ),
                      ),
                      Text(
                        snapshot.data![index].name.toString(),
                        style: TextStyle(fontSize: 38, color: Colors.red),
                      ),
                      Text(
                        snapshot.data![index].aliases
                                .toString()
                                .contains("unknown")
                            ? ""
                            : snapshot.data![index].aliases.toString(),
                      ),
                    ],
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ]),
    );
  }
}
