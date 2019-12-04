import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:learn_ar_flutter/starting_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      home: StartingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
