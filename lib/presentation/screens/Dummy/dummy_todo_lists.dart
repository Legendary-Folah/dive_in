import 'package:dive_in_app/core/constants/colors.dart';
import 'package:dive_in_app/core/constants/helper_funcs.dart';
import 'package:dive_in_app/logic/dummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummyTodoLists extends ConsumerStatefulWidget {
  const DummyTodoLists({super.key});

  @override
  ConsumerState<DummyTodoLists> createState() => _DummyTodoListsState();
}

class _DummyTodoListsState extends ConsumerState<DummyTodoLists> {
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
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : todoList.isEmpty
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
                  itemCount: todoList.length,
                  itemBuilder: (ctx, index) {
                    final todo = todoList[index];
                    return Column(
                      spacing: 10,
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textColor: ColorsConst.kWhite,
                          tileColor: Colors.black45,
                          title: Text(todo.title),
                          subtitle: Text(todo.subtitle),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              debugPrint('Todo with ${todo.id} removed');
                              ref
                                  .read(todoProvider.notifier)
                                  .removeTodo(todo.id);
                              context.showErrorSnackBar(
                                message: 'Todo: ${todo.title} removed',
                              );
                            },
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
      ),
    );
  }
}
