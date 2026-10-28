import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/Level%204%20-%20Mutable%20and%20Synchronous%20Riverpod%20State/Lesson%2034%20-%20Immutable%20State/Todo/update_todo.dart';
import 'providers/todo_provider.dart';

// import 'models/todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Page',
        ),
      ),

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateTodo(
                      todo: todo,
                    );
                  },
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                  '${todo.id}',
                ),
                subtitle: Text(
                  '${todo.title}',
                ),
                trailing: IconButton(
                  icon: Row(
                    mainAxisSize: .min,
                    children: [
                      Icon(
                        Icons.delete_outline,
                      ),
                      if (todo.isCompleted) ...[
                        Icon(
                          Icons.check,
                        ),
                      ],
                    ],
                  ),
                  onPressed: () {
                    ref.read(todoNotifierProvider.notifier).removeTodo(todo.id);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final todo = Todo(
          //   id: '34234',
          //   title: 'I love my pet.',
          //   isCompleted: true,
          // );
          ref.read(todoNotifierProvider.notifier).addTodo();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
