import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final String dateTime;
  @HiveField(4)
  final bool done;

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, desc: $desc, dateTime: $dateTime, done: $done}';
  }

  const NoteModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.dateTime,
    required this.done,
  });
}
