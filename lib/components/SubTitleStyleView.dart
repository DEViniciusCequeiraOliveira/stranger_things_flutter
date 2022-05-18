import 'package:flutter/material.dart';

class SubTitleStyleView extends StatelessWidget {
  const SubTitleStyleView({Key? key, required this.characteristic})
      : super(key: key);
  final characteristic;

  @override
  Widget build(BuildContext context) {
    final date = characteristic.toString();

    return date.contains("nknown")
        ? const SizedBox.shrink()
        : Text(
            date.replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 18),
          );
  }
}
