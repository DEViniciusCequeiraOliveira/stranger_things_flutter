import 'package:flutter/material.dart';
import 'package:stranger_things/models/Seasons.dart';
import 'package:stranger_things/screens/SeasonPage.dart';

class ListViewSeason extends StatelessWidget {
  const ListViewSeason({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot <List<Seasons>> snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var x = snapshot.data![0];
    print(x);
    return ListView.separated(
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeasonPage(index: index),
                ),
              ),
              splashColor: Colors.white10,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath.toString()}",
                fit: BoxFit.cover,
                width: size.width * 0.4,
              ),
            ),
            Text(snapshot.data![index].name.toString())
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 16,
        );
      },
    );
  }
}
