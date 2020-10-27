import 'package:flutter/material.dart';

import 'package:learn_ar_flutter/strings.dart' as strings;

import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              strings.aboutApp + "\n",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                child: Image.asset(
                  "assets/githubLogo.png",
                  color: Colors.white,
                  width: 50,
                ),
                onTap: () async {
                  if (await canLaunch(strings.repoLink))
                    await launch(strings.repoLink);
                  else
                    throw "Could not launch";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
