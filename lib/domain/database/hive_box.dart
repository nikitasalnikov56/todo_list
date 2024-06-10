
import 'package:hive/hive.dart';
import 'package:todo_list/domain/database/notes_data.dart';

abstract class HiveBox{
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
}