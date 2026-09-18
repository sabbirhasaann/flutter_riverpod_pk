import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String id;
  User({required this.id});
}

final userProvider = Provider.family<User, String>((ref, userId) {
  return User(id: userId);
});
