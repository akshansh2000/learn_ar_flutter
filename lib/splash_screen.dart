import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'starting_page.dart';

class splashScreen extends StatefulWidget {

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState(){
    super.initState();
    splashTimer();
  }

  splashTimer() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(100)
            )
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(100)
            )
        ),
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: Colors.deepPurple,
        child: Center(
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.deepPurple
                  ),
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(30)
                ),

                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Learn ARF',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SpinKitPulse(
                        color: Colors.deepPurple,
                        size: MediaQuery
                            .of(context)
                            .size
                            .width * 0.75,
                      )
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}
