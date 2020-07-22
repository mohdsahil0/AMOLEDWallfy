import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/pages/home/homePage.dart';
import 'package:flutter/material.dart';

class Routes {
  /// Setting the routes screens
  static Map<String, Widget Function(BuildContext)> routes() => {
        Frazile.home: (ctx) => HomePage(),
      };
}
