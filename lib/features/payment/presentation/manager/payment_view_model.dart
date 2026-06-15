import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/add_odoo_user_usecase.dart';
import 'payment_states.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentStates> {
  final AddOdooUserUseCase addOdooUserUseCase;

  PaymentViewModel(this.addOdooUserUseCase) : super(PaymentInitialState());

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

  void processPayment({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(PaymentLoadingState());

      try {
        final result = await addOdooUserUseCase.call(
          name: name,
          email: email,
          password: password,
          role: role,
          companyName: companyName,
        );

        result.fold(
              (failure) => emit(PaymentErrorState(failure.errorMessage)),
              (entity) => emit(PaymentSuccessState()),
        );
      } catch (e) {
        print("DEBUG: Unexpected error in processPayment: $e");
        emit(PaymentErrorState(
            "Something went wrong. Please check your connection."));
      }
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
