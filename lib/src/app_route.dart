
import 'package:flutter/material.dart';
import 'package:ss_flutter_state/src/pages/another_page.dart';
import 'package:ss_flutter_state/src/pages/home_page.dart';

class AppRoute {
  static const home = "home";
  static const another = "another";
  final _route = <String, WidgetBuilder>{
    home:(context) => const MyHomePage(title: "Homepage"),
    another:(context) => const AnotherPage(title: "AnotherPage")
  };

  get getAll => _route;
}