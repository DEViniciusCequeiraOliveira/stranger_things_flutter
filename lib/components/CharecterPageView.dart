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
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                snapshot.data![index].photo.toString(),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.80,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: Image.asset("assets/splash.gif"));
                },
              ),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.50,
            child: SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
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
                            height: MediaQuery.of(context).size.height * 0.38,
                            decoration: BoxDecoration(
                              border: Border(
                                top:
                                    BorderSide(color: Colors.white, width: 0.5),
                              ),
                            ),
                            child: TabBarView(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextStyleView(
                                        characteristic: contents.occupation),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextStyleView(
                                        characteristic: contents.affiliation),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextStyleView(
                                        characteristic: contents.residence),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextStyleSimpleView(
                                        characteristic: contents.status),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: TextStyleView(
                                          characteristic:
                                              contents.otherRelations),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextStyleView(
                                        characteristic:
                                            contents.appearsInEpisodes),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    TextStyleSimpleView(
                                        characteristic: contents.portrayedBy),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
