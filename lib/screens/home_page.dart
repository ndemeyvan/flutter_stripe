import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_app/route/route_name.dart';

import '../service_locator/service_locator.dart';
import '../stripe/logic/stripe_payment_bloc.dart';
import '../stripe/model/payment_stripe_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLiked = false;

  displayStripeBottomSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      if (kDebugMode) {
        print("### PAYMENT SUCCESS");
      }

      Navigator.of(context).pushNamed(RouteName.successScreen);
    } catch (e) {
      if (kDebugMode) {
        print("### PAYMENT FAILED OR MODAL IS MANUALY CLOSE: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt.get<StripePaymentBloc>(),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              FadeIn(
                duration: const Duration(seconds: 3),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/hamburger.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hamburger",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "1500 XAF",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeIn(
                              child: const Text(
                                "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Direction
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.place,
                                  color: Colors.black,
                                ),
                                FadeIn(
                                  child: const Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Park Avenu 25 Montreal QC , Canada",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Get directions',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Featured items",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeIn(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          height: 90,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/hamburger.jpg"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          height: 90,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/riz_saute.jpg"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          height: 90,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/poisson.jpg"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 50,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: FadeIn(
                    child: Icon(
                      CupertinoIcons.heart_fill,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 50,
                left: 15,
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Wrap(
          children: [
            BlocConsumer<StripePaymentBloc, StripePaymentState>(
              listener: (context, state) async {
                if (state is FetchStripePaymentIntentSuccess) {
                  await Stripe.instance.initPaymentSheet(
                      paymentSheetParameters: SetupPaymentSheetParameters(
                    paymentIntentClientSecret:
                        state.stripeIntentResponse?["client_secret"],
                    style: ThemeMode.dark,
                    merchantDisplayName: "Yvan Ndeme Food",
                  ));
                  //and display the bottom sheet
                  await displayStripeBottomSheet();
                }
              },
              builder: (context, state) {
                return BounceInRight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          // call pay with stripe event
                          context.read<StripePaymentBloc>().add(
                                FetchStripePaymentIntent(
                                  stripeModel: PaymentStripeModel(
                                      amount: 1500,
                                      currency: "XAF",
                                      paymentMethodTypes: "card"),
                                ),
                              );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(microseconds: 350),
                          color: Colors.black,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: checkComponentToDisplay(state: state),
                          ),
                        )),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget checkComponentToDisplay({required StripePaymentState state}) {
    if (state is StripePaymentInitial) {
      return const Text(
        "Pay",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      );
    } else if (state is FetchStripePaymentIntentLoading) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0, // Adjust thickness here
        backgroundColor: Colors.black,
        // Set value for progress (optional)
      );
    } else if (state is FetchStripePaymentIntentError) {
      return const Text(
        "Error , tap to try again",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      );
    } else {
      return const Text(
        "Pay",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      );
    }
  }
}
