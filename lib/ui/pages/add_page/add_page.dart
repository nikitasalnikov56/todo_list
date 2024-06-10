import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/components/form_widget.dart';
import 'package:todo_list/ui/components/home_button.dart';
import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: Text(
          'Add Task',
          style: AppStyle.fontStyle,
        ),
        leading: const HomeButton(),
      ),
      body: FormWidget(
        btnName: 'ADD',
        func: () {
          model.addNote(context);
        },
      ),
    );
  }
}
