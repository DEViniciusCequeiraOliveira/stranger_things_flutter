import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextStyleView extends StatelessWidget {
  const TextStyleView({Key? key, required this.characteristic, this.icon})
      : super(key: key);

  final characteristic;
  final FaIcon? icon;
  @override
  Widget build(BuildContext context) {
    final date = characteristic.toString();

    return date.contains("nknown")
        ? const SizedBox.shrink()
        : Text(
            date.substring(
              1,
              date.length - 1,
            ),
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          );
  }
}

