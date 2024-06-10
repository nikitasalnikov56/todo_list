import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/search_provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/components/card_widget.dart';
import 'package:todo_list/ui/style/app_colors.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
      child: ListView.separated(
        itemBuilder: (context, i) {
          return CardWidget(
            title: 'TODO TITLE',
            subTitle: 'TODO SUB TITLE',
            index: i,
          );
        },
        separatorBuilder: (context, i) => const SizedBox(height: 21),
        itemCount: 1,
      ),
    );
  }
}
