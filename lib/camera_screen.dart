import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    @required this.selectedModel,
    Key key,
  }) : super(key: key);

  final String selectedModel;

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  ArCoreController controller;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  _onArCoreViewCreated(ArCoreController localController) {
    controller = localController;
    controller.onPlaneTap = _onPlaneTap;
  }

  _onPlaneTap(List<ArCoreHitTestResult> hits) => _onHitDetected(hits.first);

  _onHitDetected(ArCoreHitTestResult plane) {
    controller.addArCoreNodeWithAnchor(
      ArCoreReferenceNode(
        name: widget.selectedModel,
        obcject3DFileName: widget.selectedModel + ".sfb",
        position: plane.pose.translation,
        rotation: plane.pose.rotation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
