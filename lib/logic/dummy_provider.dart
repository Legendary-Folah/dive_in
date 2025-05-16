import 'package:dive_in_app/models/dummy_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class TodoNotifier extends StateNotifier<List<DummyModel>> {
  TodoNotifier() : super([]);

  // Add Todo
  void addTodo(String title, String subTitle) {
    final newTodo = DummyModel(
      id: Uuid().v4(),
      title: title,
      subtitle: subTitle,
    );
    state = [...state, newTodo];
  }

  // Remove Todo
  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void updateTodo(String id, String title, String subtitle) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(id: id, title: title, subtitle: subtitle)
        else
          todo,
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<DummyModel>>((
  ref,
) {
  return TodoNotifier();
});
