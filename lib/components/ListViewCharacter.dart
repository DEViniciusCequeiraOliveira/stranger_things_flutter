import 'package:flutter/material.dart';
import 'package:stranger_things/screens/CharacterPage.dart';

class ListViewCharacter extends StatelessWidget {
  const ListViewCharacter({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 16,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterPage(index: index))),
              splashColor: Colors.white10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  snapshot.data![index].photo.toString(),
                  fit: BoxFit.cover,
                  height: size.height * 0.29,
                ),
              ),
            ),
            Text(
              snapshot.data![index].name.toString(),
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        );
      },
    );
  }
}
