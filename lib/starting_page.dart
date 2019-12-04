import 'package:flutter/material.dart';

import 'package:learn_ar_flutter/strings.dart' as strings;

class StartingPage extends StatelessWidget {
  const StartingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlatButton(
          child: Text(
            strings.start.toUpperCase(),
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
