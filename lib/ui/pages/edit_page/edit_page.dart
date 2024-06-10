import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/components/form_widget.dart';
import 'package:todo_list/ui/components/home_button.dart';
import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();

    final int index = GoRouterState.of(context).extra as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: Text(
          'Edit Task',
          style: AppStyle.fontStyle,
        ),
        leading: const HomeButton(),
      ),
      body: FormWidget(
        btnName: 'Update',
        func: () {
          model.changeNote(context, index);
        },
      ),
    );
  }
}
