import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:learn_ar_flutter/camera_screen.dart';
import 'package:learn_ar_flutter/model_bloc.dart';
import 'package:learn_ar_flutter/model_event.dart';
import 'package:learn_ar_flutter/strings.dart' as strings;

class StartingPage extends StatefulWidget {
  const StartingPage({Key key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  final _bloc = ModelBloc();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
          stream: _bloc.selectedModel,
          initialData: strings.carPrefab,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                customContainer(
                  strings.carPrefab,
                  size,
                  snapshot.data == strings.carPrefab,
                ),
                customContainer(
                  strings.cubePrefab,
                  size,
                  snapshot.data == strings.cubePrefab,
                ),
                FlatButton(
                  child: Text(
                    strings.start.toUpperCase(),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (builder) => CameraScreen(
                        selectedModel: snapshot.data,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget customContainer(String image, Size size, bool border) {
    return GestureDetector(
      child: Container(
        width: size.width * 7 / 10,
        height: size.width * 7 / 10,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(500),
          border: border
              ? Border.all(
                  color: Colors.redAccent,
                  width: 4,
                )
              : null,
        ),
        child: Image.asset(
          "assets/" + image + ".png",
          fit: BoxFit.contain,
        ),
      ),
      onTap: () => _bloc.modelSink.add(
        image == strings.carPrefab
            ? CarModelSelectEvent()
            : CubeModelSelectEvent(),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
