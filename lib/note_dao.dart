import 'package:floor/floor.dart';
import 'package:flutter_notepad/note_model.dart';

@dao
abstract class NoteDao{

  @Query("SELECT * FROM Note")
  Future<List<Note?>> getAllData();

  @Query("SELECT * FROM Note WHERE id= :id")
  Future<Note?> searchById(int id);

  @insert
  Future<void> insertNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

}