import 'package:flutter/material.dart';
import 'package:stranger_things/screens/SeasonPage.dart';

class ListViewSeason extends StatelessWidget {
  const ListViewSeason({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                "https://image.tmdb.org/t/p/w500${snapshot.data![index]["poster_path"].toString()}",
                fit: BoxFit.cover,
                width: size.width * 0.4,
              ),
            ),
            Text(snapshot.data![index]["name"].toString())
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
