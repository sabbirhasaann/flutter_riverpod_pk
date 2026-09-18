import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%20-%2026%20Listening%20to%20Providers/providers/auth_provider.dart';

class Lesson26ListeningToRiverpods extends ConsumerWidget {
  const Lesson26ListeningToRiverpods({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authProvider,
      (previous, next) {
        if (previous != next) {
          debugPrint("A useful message");
        }
      },
    );
    return Scaffold();
  }
}
