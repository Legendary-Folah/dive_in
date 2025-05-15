import 'package:dive_in_app/core/constants/colors.dart';
import 'package:dive_in_app/core/constants/helper_funcs.dart';
import 'package:flutter/material.dart';

class DummyTodo extends StatelessWidget {
  const DummyTodo({
    super.key,
    required this.addTodos,
    required this.titleController,
    required this.subTitleController,
  });

  final TextEditingController titleController;
  final TextEditingController subTitleController;
  final Future<void> Function(String, String) addTodos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                titleController: titleController,
                labelText: 'Title',
              ),
              CustomTextField(
                titleController: subTitleController,
                labelText: 'subTitle',
                maxLines: 3,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                height: 55,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black12),
                  ),
                  onPressed: () {
                    try {
                      if (titleController.text.isNotEmpty &&
                          subTitleController.text.isNotEmpty) {
                        debugPrint(
                          'Todo successfull added: ${titleController.text} , ${subTitleController.text}',
                        );
                        addTodos(titleController.text, subTitleController.text);
                        context.showSuccessSnackBar(
                          message: 'Todo added successfully',
                          onDismiss: () {
                            debugPrint('Todo added successfully');
                          },
                        );
                      } else {
                        debugPrint('Failed to add Todo');
                        context.showErrorSnackBar(
                          message: 'Please fill all fields',
                          onDismiss: () {
                            debugPrint('Please fill all fields');
                          },
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Add Todo',
                    style: TextStyle(color: ColorsConst.kWhite, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.titleController,
    required this.labelText,
    this.maxLines,
  });

  final TextEditingController titleController;
  final String labelText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsConst.kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        maxLines: maxLines,
        controller: titleController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConst.kBlack),
          ),
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
