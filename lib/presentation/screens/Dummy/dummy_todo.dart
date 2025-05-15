import 'package:dive_in_app/core/constants/colors.dart';
import 'package:dive_in_app/models/dummy_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DummyTodo extends StatefulWidget {
  const DummyTodo({super.key});

  @override
  State<DummyTodo> createState() => _DummyTodoState();
}

class _DummyTodoState extends State<DummyTodo> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final List<DummyModel> dummyList = [];

  Future<void> addTodos(String title, String subTitle) async {
    final uid = Uuid().v4();
    setState(() {
      dummyList.add(DummyModel(title: title, subTitle: subTitle, id: uid));
      titleController.clear();
      subTitleController.clear();
    });
  }

  Future<void> removeTodo(String id) async {
    dummyList.removeWhere((element) => element.id == id);
  }

  Future<void> updateTodo(String id, String title, String subTitle) async {
    final index = dummyList.indexWhere((element) => element.id == id);
    index != -1
        ? setState(() {
          dummyList[index] = DummyModel(
            title: title,
            subTitle: subTitle,
            id: id,
          );
        })
        : debugPrint('Todo with $id not found');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: subTitleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextButton(
              onPressed: () {
                addTodos(titleController.text, subTitleController.text);
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
