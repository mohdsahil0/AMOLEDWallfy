import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class Frazile {
  //* Names
  static const String appName = 'Food Wallfy';
  static const String aboutScreen = 'About';
  static const String settingsScreen = 'Settings';
  static const String donateScreen = 'Donate';

  //* Service Caller Settings
  static const String baseURL = "https://api.unsplash.com/search/photos";
  static const String clientId =
      "6fa91622109e859b1c40218a5dead99f7262cf4f698b1e2cb89dd18fc5824d15";
  static const String query = "food";
  static const String orientation = "portrait";
  static const int perPage = 10;
  static int page = 1;

  //* DB Settings
  // static const int dbversion = 1;
  // static const String gradientTB = "Gradients";

  //* Error Messages
  String errorMessage;
  getErrorMessage(errorsData) {
    try {
      if (errorsData.response != null) {
        var responseData = json.decode(errorsData.response.toString());
        if (responseData['errors'] != null) {
          var errors = responseData['errors'];
          errors.forEach((k, v) => errorMessage = v[0].toString());
        } else {
          errorMessage = "Server error";
        }
      } else {
        errorMessage = "Server error";
      }
      return errorMessage;
    } catch (e) {
      return "Server error";
    }
  }

  //* SnackBars
  final snackBar = SnackBar(
    content: Text('No Internet Connection!'),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  //* Preferences
  static SharedPreferences prefs;
  static const String darkModePref = "darkModePref";

  //* Fonts
  static const String googleFamily = 'google';

  //* Loaders
  Widget gradientLoader() => SpinKitThreeBounce(
        size: 70.0,
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: FzColors().getLoaderColors(),
              tileMode: TileMode.clamp,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: FzColors().getLoaderStops(),
            ),
          ),
        ),
      );

  //* Sizes
  static const double appBarTitleSize = 20.0;
  static const double appBarLetterSpacing = 3.0;
  static const EdgeInsets gradientListTileTitlePadding = EdgeInsets.only(
    bottom: 10.0,
  );
  static const double gradientListTileTitleSize = 16.0;
  static const FontWeight gradientListTileFontWeight = FontWeight.w300;
  static const String gradientListTileFontFamily = 'google';
  static const double gradientListTileTitleLetterSpacing = 3.0;

  //* Routes
  static const String home = '/';
  static const String fullImage = '/fullimage';
  static const String about = '/about';
  static const String settings = '/settings';
  static const String donate = '/donate';

  //* Image Urls
  static const String profilePic =
      'https://scontent-bom1-2.cdninstagram.com/v/t51.2885-19/s320x320/90319768_530732907836311_5744324372475150336_n.jpg?_nc_ht=scontent-bom1-2.cdninstagram.com&_nc_ohc=TCo-oXAhTgEAX_5gZF2&oh=b8b6f89d78547b35ec368fcccd8dca77&oe=5F306C1D';
}
