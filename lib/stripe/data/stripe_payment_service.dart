import 'package:dio/dio.dart';

import '../../constant.dart';
import '../model/payment_stripe_model.dart';

class StripePaymentService {
  Future<dynamic> fetchStripePaymentIntent({
    required PaymentStripeModel payload,
  }) async {
    String authorizationBearer = 'Bearer ${Constant.stripeSecretKey}';

    final dio = Dio();
    final options = Options(
      headers: {
        'Authorization': authorizationBearer,
      },
      contentType: Headers.formUrlEncodedContentType,
    );

    final response = await dio.post(
      Constant.stripePaymentIntent,
      data: payload.toJson(),
      options: options,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      return Exception("An error occur , please try again.");
    }
  }
}
