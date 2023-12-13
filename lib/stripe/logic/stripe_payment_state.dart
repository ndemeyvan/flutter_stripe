part of 'stripe_payment_bloc.dart';

abstract class StripePaymentState {
  final Map<String, dynamic>? stripeIntentResponse;
  const StripePaymentState({this.stripeIntentResponse});
}

class StripePaymentInitial extends StripePaymentState {}

class FetchStripePaymentIntentLoading extends StripePaymentState {}

class FetchStripePaymentIntentSuccess extends StripePaymentState {
  const FetchStripePaymentIntentSuccess({
    super.stripeIntentResponse,
  });
}

class FetchStripePaymentIntentError extends StripePaymentState {}


class NavigateToSuccessPage extends StripePaymentState {}
