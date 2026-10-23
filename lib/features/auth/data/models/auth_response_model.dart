import 'auth_tokens_model.dart';
import 'user_model.dart';

class AuthResponseModel {
  final AuthTokensModel tokens;
  final UserModel user;

  AuthResponseModel({
    required this.tokens,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      tokens: AuthTokensModel.fromJson(json),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
