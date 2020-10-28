import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:learn_ar_flutter/camera_screen.dart';
import 'package:learn_ar_flutter/model_bloc.dart';
import 'package:learn_ar_flutter/model_event.dart';
import 'package:learn_ar_flutter/about_widget.dart';
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
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LearnARF',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AboutWidget(),
            ),
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.selectedModel,
          initialData: strings.statuePrefab,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(5.0),
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: <Widget>[
                        customContainer(
                          strings.statuePrefab,
                          size,
                          snapshot.data == strings.statuePrefab,
                        ),
                        customContainer(
                          strings.cubePrefab,
                          size,
                          snapshot.data == strings.cubePrefab,
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      strings.start.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText1,
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customContainer(String image, Size size, bool border) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: size.width * 7 / 10,
        height: size.width * 7 / 10,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(500),
          border: border
              ? Border.all(
                  color: Theme.of(context).accentColor,
                  width: 6,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: Image.asset(
            "assets/" + image + ".png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      onTap: () => _bloc.modelSink.add(
        image == strings.statuePrefab
            ? StatueModelSelectEvent()
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
