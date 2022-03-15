import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_notepad/note_dao.dart';
import 'note_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Note])
abstract class MyDatabase extends FloorDatabase{
  NoteDao get noteDao;
}