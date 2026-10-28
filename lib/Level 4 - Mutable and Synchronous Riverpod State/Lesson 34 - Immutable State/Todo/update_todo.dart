import 'package:flutter/material.dart';
import 'package:flutter_riverpod_pk/Level%204%20-%20Mutable%20and%20Synchronous%20Riverpod%20State/Lesson%2034%20-%20Immutable%20State/Todo/providers/todo_provider.dart';
import 'models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateTodo extends ConsumerWidget {
  final Todo todo;
  const UpdateTodo({
    super.key,
    required this.todo,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo.title,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(todoNotifierProvider.notifier).updateTodo(todo.id);
            Navigator.of(context).pop();
          },
          child: Text('Update'),
        ),
      ),
    );
  }
}
