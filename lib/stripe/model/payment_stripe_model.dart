class PaymentStripeModel {
  num? amount;
  String? currency;
  String paymentMethodTypes;

  PaymentStripeModel({
    required this.amount,
    required this.currency,
    required this.paymentMethodTypes,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['currency'] = currency;
    data['payment_method_types[0]'] = paymentMethodTypes;
    return data;
  }
}
