import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('Learn ARF'),
      content: SelectableText(
          'LearnARF is a Flutter application which uses Google\'s ARCore to spawn 3D models into the real world. Additionally, it uses the Sceneform SDK to make it easier to handle 3D models.\n\nGithub Repository\ngithub.com/akshansh2000/learn_ar_flutter', textAlign: TextAlign.center,),
    );
  }
}
