import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  static int last = 0;

  @override
  List<Todo> build() => [];

  void addTodo() {
    final todo = Todo(
      id: last.toString(),
      isCompleted: false,
      title: 'Title $last',
    );

    last += 1;

    state = [...state, todo];
  }

  void updateTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isCompleted: true) else todo,
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoNotifierProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new,
);
