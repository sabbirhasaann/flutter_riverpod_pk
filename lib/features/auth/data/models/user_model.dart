import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("json.. $json");
    return UserModel(
      id: json['id'] as int,
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone_number'],
      isEmailVerified: json['is_email_verified'],
    );
  }
}
