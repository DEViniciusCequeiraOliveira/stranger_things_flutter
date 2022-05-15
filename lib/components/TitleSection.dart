import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key, required this.titleName}) : super(key: key);
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        titleName,
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),
    );
  }
}
