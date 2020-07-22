import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class Frazile {
  //* Names
  static const String appName = 'AMOLED Wallfy';
  static const String aboutScreen = 'About';
  static const String settingsScreen = 'Settings';
  static const String donateScreen = 'Donate';

  //* Service Caller Settings
  static const String baseURL = "https://api.unsplash.com/search/photos";
  static const String clientId =
      "6fa91622109e859b1c40218a5dead99f7262cf4f698b1e2cb89dd18fc5824d15";
  static const String query = "dark";
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

  //* Sizes

  //* Routes
  static const String initial = home;
  static const String home = '/';

  //* Image Urls
  static const String profilePic =
      'https://scontent-bom1-2.cdninstagram.com/v/t51.2885-19/s320x320/90319768_530732907836311_5744324372475150336_n.jpg?_nc_ht=scontent-bom1-2.cdninstagram.com&_nc_ohc=TCo-oXAhTgEAX_5gZF2&oh=b8b6f89d78547b35ec368fcccd8dca77&oe=5F306C1D';
}
