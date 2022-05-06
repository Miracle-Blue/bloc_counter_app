import 'package:bloc_lesson_1/presentation/pages/home_page.dart';
import 'package:bloc_lesson_1/presentation/pages/second_page.dart';
import 'package:bloc_lesson_1/presentation/pages/settings_page.dart';
import 'package:bloc_lesson_1/presentation/pages/third_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // for passing `values` in Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case HomePage.id:
        return MaterialPageRoute(
          builder: (_) => const HomePage(title: 'Home Page'),
        );
      case SecondPage.id:
        return MaterialPageRoute(
          builder: (_) => const SecondPage(title: 'Second Page'),
        );
      case ThirdPage.id:
        return MaterialPageRoute(
          builder: (_) => const ThirdPage(title: 'Third Page'),
        );
      case SettingsPage.id:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(title: 'Third Page'),
        );
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            "Error Route",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
