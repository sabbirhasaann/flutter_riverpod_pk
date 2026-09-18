import 'package:flutter/material.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%20-%2026%20Listening%20to%20Providers/login_page.dart';
import 'package:flutter_riverpod_pk/LEVEL%203%20-%20Riverpod%20Fundamentals/Lesson%2028%20-%20Provider%20Lifecycle/auto_dispose_example.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    ];
    return MaterialApp(
      title: 'Flutter Riverpd',
      home: Scaffold(
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
      ),
    );
  }
}
