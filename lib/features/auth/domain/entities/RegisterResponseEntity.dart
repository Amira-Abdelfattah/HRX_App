import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
  final String? message;
  final String? token;

  const RegisterResponseEntity({this.message, this.token});

  @override
  List<Object?> get props => [message, token];
}
