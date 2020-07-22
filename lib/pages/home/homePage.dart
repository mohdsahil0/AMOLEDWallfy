import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/gradients.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPress() => showCupertinoModalPopup(
        context: context,
        builder: (context) => new CupertinoActionSheet(
          title: Text("Do you wish to close the app ?"),
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Close"),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          message: Text("Have you reviewed the app on Playstore yet ?"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text("Review now on Playstore"),
              onPressed: () {
                Navigator.pop(context);
                LaunchReview.launch();
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Connect with the Developer"),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text("Share the App"),
              onPressed: () => Share.text(
                'vkfdrnhogi',
                "Hey! Check out this app on Playstore. Movienator is a Movie and TV Shows Database app. If you love the app please review the",
                '',
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent.withOpacity(
          0.7,
        ),
      ),
    );

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: FzColors.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -(height * .085),
                    left: -(width * .33),
                    child: Container(
                      height: height * .45,
                      width: (width - 22) * .98941176,
                      decoration: BoxDecoration(
                        gradient: FzGradients.yellowOrangeGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
