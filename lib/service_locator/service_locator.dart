import 'package:get_it/get_it.dart';
import '../stripe/data/stripe_payment_repository.dart';
import '../stripe/data/stripe_payment_service.dart';
import '../stripe/logic/stripe_payment_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLoton() async {
  StripePaymentService stripePaymentService = StripePaymentService();

  getIt.registerSingleton<StripePaymentService>(
    stripePaymentService,
  );

  getIt.registerSingleton<StripePaymentRepository>(
    PaymentProviderRepositoryImpl(
      stripePaymentService: getIt.get<StripePaymentService>(),
    ),
  );

  getIt.registerSingleton<StripePaymentBloc>(
    StripePaymentBloc(
      stripePaymentRepository: getIt.get<StripePaymentRepository>(),
    ),
  );
}
