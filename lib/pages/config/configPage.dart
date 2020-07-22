import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/mixin/portrait.dart';
import 'package:AMOLED/providers/provider.dart';
import 'package:AMOLED/routes/routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage>
    with PortraitStatefulModeMixin<ConfigPage> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        title: Frazile.appName,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        theme: ThemeData(
          fontFamily: Frazile.googleFamily,
          primarySwatch: Colors.red,
          primaryColor: FzColors.appColor,
          canvasColor: FzColors.canvasColor,
          primaryIconTheme: IconThemeData(
            color: FzColors.iconColor,
          ),
          // disabledColor: Colors.grey,
          cardColor: Colors.white,
          primaryTextTheme: Theme.of(context).textTheme.apply(
                bodyColor: FzColors.textColor,
                displayColor: FzColors.textColor,
              ),
          // brightness: Brightness.light,
        ),
        initialRoute: Frazile.initial,
        routes: Routes.routes(),
      ),
    );
  }
}
