import 'package:flutter/material.dart';

class DialogComponents extends StatelessWidget {
  const DialogComponents({Key? key, required this.title, this.subTitle}) : super(key: key);
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            subTitle ?? "",
            textAlign: TextAlign.center,
          ) 
        ],
      ),
    );
  }
}
