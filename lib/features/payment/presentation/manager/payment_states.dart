abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {}

class PaymentErrorState extends PaymentStates {
  final String message;

  PaymentErrorState(this.message);
}

class PaymentUpdateState extends PaymentStates {}
