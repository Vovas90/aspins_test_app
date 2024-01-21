import 'package:aspins_test_app/screens/home/home_screen.dart';
import 'package:aspins_test_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

/// ************************************
/// ROUTE NAMES

/// Main routes:
const String splash = 'splash';
const String home = 'home';

/// ************************************

Route<dynamic> routes(RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        final name = settings.name;
        switch (name) {
          case splash:
            return const SplashScreen();
          case home:
            return const HomeScreen();
          default:
            throw ('Route name does not exist');
        }
      });
}

void goTo(BuildContext context, String routeName, {bool clearStack = false}) => clearStack
    ? Navigator.pushNamedAndRemoveUntil(context, home, (r) => false)
    : Navigator.pushNamed(context, routeName);

void goBack(BuildContext context) => Navigator.pop(context);

