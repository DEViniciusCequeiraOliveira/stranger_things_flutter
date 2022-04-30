import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextStyleView extends StatelessWidget {
  const TextStyleView(
      {Key? key, required this.characteristic, this.style, this.icon})
      : super(key: key);
  final style;
  final characteristic;
  final FaIcon? icon;
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
          );

    /* return date.contains("unknown")
        ? const Text("")
        : Row(
            children: [
              icon != null
                  ? icon!
                  : const SizedBox(
                      width: 0.1,
                    ),
             Text(
               date.substring(
                 1,
                 date.length - 1,
               ),
             ),
            ],
          ); */
  }
}
