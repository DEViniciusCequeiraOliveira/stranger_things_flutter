import 'package:flutter/material.dart';
import 'package:stranger_things/components/CharecterPageView.dart';
import 'package:stranger_things/components/LoadingComponents.dart';
import 'package:stranger_things/models/Character.dart';
import 'package:stranger_things/repository/apiStrangerThings.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key, required this.index}) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  final PageController controller =
                      PageController(initialPage: index);
                  return PageView.builder(
                    controller: controller,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, i) {
                      return CharecterPageView(
                          context: context, snapshot: snapshot, index: i);
                    },
                  );
                }

                return LoadingComponents();
              },
            ),
          )
        ],
      ),
    );
  }
}
