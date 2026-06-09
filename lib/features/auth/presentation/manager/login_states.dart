import '../../domain/entities/login_response_entity.dart';

abstract class LoginStates {
  const LoginStates();
}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginResponseEntity response;

  const LoginSuccessState(this.response);
}

class LoginErrorState extends LoginStates {
  final String message;

  const LoginErrorState(this.message);
}

class LoginUpdateState extends LoginStates {}
