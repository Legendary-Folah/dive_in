import 'package:dive_in_app/presentation/screens/Dummy/dummy_todo.dart';
import 'package:dive_in_app/presentation/screens/Dummy/dummy_todo_lists.dart';
import 'package:flutter/material.dart';

class DummyHome extends StatefulWidget {
  const DummyHome({super.key});

  @override
  State<DummyHome> createState() => _DummyHomeState();
}

class _DummyHomeState extends State<DummyHome> {
  int _currentIndex = 0;

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
