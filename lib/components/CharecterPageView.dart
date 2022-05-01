import 'package:flutter/material.dart';
import 'SubTitleStyleView.dart';
import 'TextStyleSimpleView.dart';
import 'TextStyleView.dart';
import 'TitleStyleView.dart';

class CharecterPageView extends StatelessWidget {
  const CharecterPageView(
      {Key? key,
      required this.context,
      required this.snapshot,
      required this.index})
      : super(key: key);
  final context;
  final snapshot;
  final index;

  @override
  Widget build(BuildContext context) {
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
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.40,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                      SubTitleStyleView(characteristic: contents.aliases),
                      DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              Container(
                                child: TabBar(
                                  labelColor: Colors.red,
                                  indicatorColor: Colors.red,
                                  unselectedLabelColor: Colors.white,
                                  tabs: [
                                    Tab(text: 'Informações'),
                                    Tab(text: 'Amigos'),
                                    Tab(text: 'Episodios'),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.14,
                                decoration: BoxDecoration(
                                  border: Border(

                                    top: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                ),
                                child: TabBarView(
                                  children: [
                                    Column(
                                      children: [
                                        TextStyleView(
                                            characteristic:
                                                contents.occupation),
                                        TextStyleView(
                                            characteristic:
                                                contents.affiliation),
                                        TextStyleView(
                                            characteristic: contents.residence),
                                        TextStyleSimpleView(
                                            characteristic: contents.status),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextStyleView(
                                            characteristic:
                                                contents.otherRelations),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextStyleView(
                                            characteristic:
                                                contents.appearsInEpisodes),
                                        TextStyleSimpleView(
                                            characteristic:
                                                contents.portrayedBy),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
