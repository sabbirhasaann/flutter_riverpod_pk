import 'package:flutter/material.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%20-%2026%20Listening%20to%20Providers/login_page.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%2028%20-%20Provider%20Lifecycle/auto_dispose_example.dart';
import 'package:flutter_riverpod_pk/Level%204%20-%20Mutable%20and%20Synchronous%20Riverpod%20State/Lesson%2032%20-%20Notifier/Cart%20Example/cart_example.dart';
import 'package:flutter_riverpod_pk/Level%204%20-%20Mutable%20and%20Synchronous%20Riverpod%20State/Lesson%2032%20-%20Notifier/Simple%20Counter/a_simple_counter_example.dart';

import '../Level 4 - Mutable and Synchronous Riverpod State/Lesson 33 - Notifier Provider/Shopping Cart/cart_summary.dart';
import '../Level 4 - Mutable and Synchronous Riverpod State/Lesson 33 - Notifier Provider/Simple Counter/counter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> screens = [
      {
        "title": 'Level 3 Riverpod Fundamentals',
        "screen": LoginPage(),
      },
      {
        "title": 'Level 3 Riverpod Fundamentals - Auto Dispose Example',
        "screen": AutoDisposeExample(),
      },
      {
        "title":
            "Level 4 Mutable and Synchronous Riverpod State - Lesson 32 - Notifier - A Simple Counter Example",
        "screen": ASimpleCounterExample(),
      },
      {
        "title":
            "Level 4 Mutable and Synchronous Riverpod State - Lesson 32 - Notifier - Cart Example",
        "screen": CartExample(),
      },
      {
        "title":
            "Level 4 Mutable and Synchronous Riverpod State - Lesson 33 - NotifierProvider - Simple Counter",
        "screen": CounterPage(),
      },
      {
        "title":
            "Level 4 Mutable and Synchronous Riverpod State - Lesson 33 - NotifierProvider - Shopping Cart Summary",
        "screen": CartSummary(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          final screen = screens[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(screen["title"]),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return screen["screen"];
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
