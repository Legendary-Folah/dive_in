import 'package:dive_in_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DummyTodoLists extends StatefulWidget {
  const DummyTodoLists({super.key});

  @override
  State<DummyTodoLists> createState() => _DummyTodoListsState();
}

class _DummyTodoListsState extends State<DummyTodoLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dummy Todo Lists'), centerTitle: true),
      backgroundColor: ColorsConst.kWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            // Dummy data for demonstration
            return ListView();
          },
        ),
      ),
    );
  }
}
