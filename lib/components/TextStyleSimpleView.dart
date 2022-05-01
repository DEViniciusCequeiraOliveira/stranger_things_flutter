import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextStyleSimpleView extends StatelessWidget {
  const TextStyleSimpleView({Key? key, required this.characteristic, this.style, this.icon})
      : super(key: key);
  final style;
  final characteristic;
  final FaIcon? icon;
  @override
  Widget build(BuildContext context) {
    final date = characteristic.toString();

    return date.contains("nknown") ? SizedBox.shrink() : Text(date);
  }
}
