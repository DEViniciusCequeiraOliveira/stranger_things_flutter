import 'package:flutter/material.dart';

class SubTitleStyleView extends StatelessWidget {
  const SubTitleStyleView({Key? key, required this.characteristic}) : super(key: key);
  final characteristic;

  @override
  Widget build(BuildContext context) {
    final date = characteristic.toString();

    return date.contains("nknown")
        ? SizedBox.shrink()
        : Text(
            date.substring(
              1,
              date.length - 1,
            ),
            style: TextStyle(fontSize: 18),
          );
  }
}
