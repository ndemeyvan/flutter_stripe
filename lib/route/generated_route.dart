import 'package:flutter/material.dart';
import 'package:flutter_stripe_app/route/route_name.dart';
import 'package:flutter_stripe_app/screens/home_page.dart';
import 'package:flutter_stripe_app/screens/success_page.dart';

import '../screens/undefined_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  String? routeName = settings.name;
  Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

  switch (routeName) {
    case RouteName.home:
      return MaterialPageRoute<Widget>(builder: (_) => const MyHomePage());
    case RouteName.successScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const SuccessPage());
    default:
      return MaterialPageRoute(builder: (_) => const UndefinedPage());
  }
}
