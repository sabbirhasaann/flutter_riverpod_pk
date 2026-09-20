import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [];

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void updateTodo(int id) {


    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isCompleted: true) else todo,
    ];
  }
}
