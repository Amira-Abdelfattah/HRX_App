import '../../domain/entities/RegisterResponseEntity.dart';

class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({super.message, super.token});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'token': token};
  }
}
