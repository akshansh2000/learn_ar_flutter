import 'package:flutter/material.dart';

import 'package:learn_ar_flutter/strings.dart' as strings;

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        'LearnARF',
        textAlign: TextAlign.center,
      ),
      content: Text(
        strings.aboutApp,
        textAlign: TextAlign.center,
      ),
    );
  }
}
