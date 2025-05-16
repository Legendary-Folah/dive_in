import 'package:dive_in_app/presentation/screens/Dummy/dummy_todo.dart';
import 'package:dive_in_app/presentation/screens/Dummy/dummy_todo_lists.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../models/dummy_model.dart';

class DummyHome extends StatefulWidget {
  const DummyHome({super.key});

  @override
  State<DummyHome> createState() => _DummyHomeState();
}

class _DummyHomeState extends State<DummyHome> {
  int _currentIndex = 0;

  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final List<DummyModel> dummyList = [];

  Future<void> addTodos(String title, String subTitle) async {
    final uid = Uuid().v4();
    setState(() {
      dummyList.add(DummyModel(title: title, subtitle: subTitle, id: uid));
      titleController.clear();
      subTitleController.clear();
    });
  }

  Future<void> removeTodo(String id) async {
    setState(() {
      dummyList.removeWhere((element) => element.id == id);
      debugPrint('Todo with $id removed');
    });
  }

  Future<void> updateTodo(String id, String title, String subTitle) async {
    final index = dummyList.indexWhere((element) => element.id == id);
    index != -1
        ? setState(() {
          dummyList[index] = DummyModel(
            title: title,
            subtitle: subTitle,
            id: id,
          );
          debugPrint('Todo with $id updated');
        })
        : debugPrint('Todo with $id not found');
  }

  void onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dummy ToDo...'), centerTitle: true),
      backgroundColor: Colors.white,
      body: _currentIndex == 0 ? DummyTodo() : DummyTodoLists(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black12,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
      ),
    );
  }
}
