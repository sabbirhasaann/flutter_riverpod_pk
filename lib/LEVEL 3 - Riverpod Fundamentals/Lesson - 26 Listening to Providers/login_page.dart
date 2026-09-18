import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%20-%2026%20Listening%20to%20Providers/providers/auth_provider_2.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(authProvider2, (previous, next) {
      if (next == AuthState.isAuthenticated) {
        // perform navigation or another side effect
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider2);
    return Scaffold(
      body: Center(
        child: Text(
          authState == AuthState.isAuthenticated ? 'Welcome' : 'Please log in',
        ),
      ),
    );
  }
}
