import 'package:flutter/material.dart';

class LoadingComponents extends StatelessWidget {
  const LoadingComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: AlertDialog(
          backgroundColor: Colors.black,
          content: Container(
            child:
                Image.network("https://giffiles.alphacoders.com/156/15671.gif"),
            width: 300,
          ),
        ),
      ),
    );
  }
}
