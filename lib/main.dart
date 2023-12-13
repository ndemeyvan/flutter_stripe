
import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_app/constant.dart';
import 'package:flutter_stripe_app/route/route_name.dart';
import 'route/generated_route.dart';
import 'service_locator/service_locator.dart';

void main() {
  setupServiceLoton();
  WidgetsFlutterBinding.ensureInitialized(); // <- you don't have this line
  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = Constant.stripePublicKeyPaymentKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stripe Demo',
      theme: ThemeData(
        fontFamily: Constant.criteriaCfRegular400,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.home,
      onGenerateRoute: generateRoute,
    );
  }
}
