import 'package:flutter/material.dart';
import 'package:learnbloc/presentation/screens/home_screen.dart';
import 'package:learnbloc/presentation/screens/second_screen.dart';
import 'package:learnbloc/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (context) => const SecondScreen(
                  title: 'Second Screen',
                  color: Colors.red,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (context) => const ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.green,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(
                  title: 'Second Screen',
                  color: Colors.red,
                ));
    }
  }
}
