class User {
  final int id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final bool? isEmailVerified;

  User({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.isEmailVerified = false,
  });
}
