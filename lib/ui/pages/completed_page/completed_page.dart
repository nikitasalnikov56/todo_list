import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/database/hive_box.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/components/card_widget.dart';
import 'package:todo_list/ui/style/app_colors.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<TodoProvider>();

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
      child: ValueListenableBuilder(
        valueListenable: HiveBox.notes.listenable(),
        builder: (context, notes, _) {
          final allNotes = notes.values.toList();
          return ListView.separated(
            itemBuilder: (context, i) {
              return allNotes[i].isChecked ? CardWidget(
                title: '${allNotes[i].title}',
                subTitle: '${allNotes[i].text}',
                index: i,
              ): const SizedBox();
            },
            separatorBuilder: (context, i) => const SizedBox(height: 21),
            itemCount: allNotes.length,
          );
        }
      ),
    );
  }
}
