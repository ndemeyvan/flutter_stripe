import 'package:flutter/foundation.dart';

import '../model/payment_stripe_model.dart';
import 'stripe_payment_service.dart';

abstract class StripePaymentRepository {
  Future<dynamic> fetchStripePaymentIntent({
    required PaymentStripeModel payload,
  });
}

class PaymentProviderRepositoryImpl extends StripePaymentRepository {
  final StripePaymentService stripePaymentService;
  PaymentProviderRepositoryImpl({
    required this.stripePaymentService,
  });

  @override
  Future<dynamic> fetchStripePaymentIntent({
    required PaymentStripeModel payload,
  }) async {
    if (kDebugMode) {}
    return await stripePaymentService.fetchStripePaymentIntent(
      payload: payload,
    );
  }
}
