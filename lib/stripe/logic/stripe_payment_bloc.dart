import 'package:bloc/bloc.dart';

import '../data/stripe_payment_repository.dart';
import '../model/payment_stripe_model.dart';

part 'stripe_payment_event.dart';
part 'stripe_payment_state.dart';

class StripePaymentBloc extends Bloc<StripePaymentEvent, StripePaymentState> {
  final StripePaymentRepository stripePaymentRepository;
  StripePaymentBloc({required this.stripePaymentRepository})
      : super(StripePaymentInitial()) {
    on<FetchStripePaymentIntent>(_onFetchStripePaymentIntent);
  }

  void _onFetchStripePaymentIntent(
      FetchStripePaymentIntent event, Emitter<StripePaymentState> emit) async {
    try {
      emit(FetchStripePaymentIntentLoading());
      Map<String, dynamic>? response = await stripePaymentRepository.fetchStripePaymentIntent(
        payload: event.stripeModel,
      );
      emit(FetchStripePaymentIntentSuccess(
        stripeIntentResponse: response!,
      ));
    } catch (e) {
      print(e);
      emit(FetchStripePaymentIntentError());
    }
  }
}
