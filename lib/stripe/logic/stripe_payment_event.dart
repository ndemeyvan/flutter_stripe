part of 'stripe_payment_bloc.dart';

abstract class StripePaymentEvent {}

class FetchStripePaymentIntent extends StripePaymentEvent {
  final PaymentStripeModel stripeModel;
  FetchStripePaymentIntent({
    required this.stripeModel,
  });
}
