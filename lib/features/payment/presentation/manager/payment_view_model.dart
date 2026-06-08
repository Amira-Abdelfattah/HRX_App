import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_states.dart';

class PaymentViewModel extends Cubit<PaymentStates> {
  PaymentViewModel() : super(PaymentInitialState());

  static PaymentViewModel get(context) => BlocProvider.of(context);

  bool isAnnual = true;
  int selectedPlanIndex = 1;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  final cvvFocusNode = FocusNode();
  bool isCvvFocused = false;

  void init() {
    nameController.addListener(() => emit(PaymentUpdateState()));
    cardNumberController.addListener(() => emit(PaymentUpdateState()));
    expiryController.addListener(() => emit(PaymentUpdateState()));
    cvvController.addListener(() => emit(PaymentUpdateState()));

    cvvFocusNode.addListener(() {
      isCvvFocused = cvvFocusNode.hasFocus;
      emit(PaymentUpdateState());
    });
  }

  void toggleBilling(bool value) {
    isAnnual = value;
    emit(PaymentUpdateState());
  }

  void selectPlan(int index) {
    selectedPlanIndex = index;
    emit(PaymentUpdateState());
  }

  void updateCardInfo() {
    emit(PaymentUpdateState());
  }

  void processPayment() {
    if (formKey.currentState!.validate()) {
      emit(PaymentLoadingState());
      Future.delayed(const Duration(seconds: 2), () {
        emit(PaymentSuccessState());
      });
    } else {
      emit(PaymentErrorState('Please enter all required data first.'));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    cvvFocusNode.dispose();
    return super.close();
  }
}
