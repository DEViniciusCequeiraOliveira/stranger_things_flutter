import 'package:flutter/material.dart';

class TitleStyleView extends StatelessWidget {
  const TitleStyleView({Key? key, required this.characteristic})
      : super(key: key);
  final characteristic;

  @override
  Widget build(BuildContext context) {
    final date = characteristic.toString();
    return Text(
      date,
      style: TextStyle(fontSize: 36, color: Colors.red),
    );
  }
}
