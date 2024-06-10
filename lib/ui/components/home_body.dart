import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/database/hive_box.dart';
import 'package:todo_list/domain/database/notes_data.dart';
import 'package:todo_list/ui/components/card_widget.dart';
import 'package:todo_list/ui/style/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
      child: ValueListenableBuilder(
        valueListenable: HiveBox.notes.listenable(),
        builder: (context, Box<NotesData> notes, _) {
          final allNotes = notes.values.toList();
          return ListView.separated(
            itemBuilder: (context, i) {
              return CardWidget(
                title: '${allNotes[i].title}',
                subTitle: allNotes[i].text.toString(),
                index: i,
              );
            },
            separatorBuilder: (context, i) => const SizedBox(height: 21),
            itemCount: allNotes.length,
          );
        }
      ),
    );
  }
}
