import 'package:dive_in_app/models/dummy_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DummyList extends StatefulWidget {
  const DummyList({super.key});

  @override
  State<DummyList> createState() => _DummyListState();
}

class _DummyListState extends State<DummyList> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final uid = Uuid().v4();

  final List<DummyModel> dummyList = [];

  Future<void> addTodos(String title, String subTitle, String id) async {
    setState(() {
      dummyList.add(DummyModel(title: title, subTitle: subTitle, id: id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: TextButton(
          onPressed: () {
            addTodos(titleController.text, subTitleController.text, uid);
          },
          child: Text('Add Todo'),
        ),
      ),
    );
  }
}
