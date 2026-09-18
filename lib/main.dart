import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/app/my_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}
