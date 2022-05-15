import 'package:flutter/material.dart';

class MaxQueriesComponents extends StatelessWidget {
  const MaxQueriesComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CHEGAMOS AO MÁXIMO DE COTAS DA API",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text("volte amanhã por favor!! :)", textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
