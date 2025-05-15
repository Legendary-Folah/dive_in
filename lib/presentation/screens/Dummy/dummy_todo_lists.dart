import 'package:dive_in_app/core/constants/colors.dart';
import 'package:dive_in_app/core/constants/helper_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/dummy_model.dart';

class DummyTodoLists extends StatefulWidget {
  const DummyTodoLists({
    super.key,
    required this.dummyList,
    required this.removeTodo,
  });

  final List<DummyModel> dummyList;
  final Future<void> Function(String) removeTodo;

  @override
  State<DummyTodoLists> createState() => _DummyTodoListsState();
}

class _DummyTodoListsState extends State<DummyTodoLists> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : widget.dummyList.isEmpty
                ? Center(
                  child: Column(
                    spacing: 30,
                    children: [
                      Text('No Todos Found', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SvgPicture.asset('assets/svg/emptylist.svg'),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  itemCount: widget.dummyList.length,
                  itemBuilder: (ctx, index) {
                    final todo = widget.dummyList[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textColor: ColorsConst.kWhite,
                      tileColor: Colors.black45,
                      title: Text(todo.title ?? ''),
                      subtitle: Text(todo.subTitle ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          widget.removeTodo(todo.id ?? '');
                          debugPrint('Todo with ${todo.id} removed');
                          context.showErrorSnackBar(
                            message: 'Todo id : ${todo.id} removed',
                          );
                        },
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
