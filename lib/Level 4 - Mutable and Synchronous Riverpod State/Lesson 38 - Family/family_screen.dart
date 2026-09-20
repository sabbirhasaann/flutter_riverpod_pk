import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/product_selection_provider.dart';

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(productSelectionProvider(10));
    return Scaffold(
      body: Center(
        child: Text(
          selection.toString(),
        ),
      ),
    );
  }
}
