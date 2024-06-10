import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/database/hive_box.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/routes/app_routes.dart';

import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required  this.index,
  });

  final String title, subTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();
    final allNotes = HiveBox.notes.values.toList();
    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.todoInfo, extra: index);
      },
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 19, right: 25, top: 22, bottom: 22),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              title,
              style: AppStyle.fontStyle
                  .copyWith(fontSize: 18, color: AppColors.purple),
            ),
            subtitle: Text(
              subTitle,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.go(AppRoutes.edit, extra: index);
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.lightPurple,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    model.deleteNote(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.lightPurple,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    model.checkNote(index);
                  },
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: allNotes[index].isChecked
                        ? Colors.green
                        : AppColors.lightPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
