
import 'package:floor/floor.dart';

@entity
class Note{
  @primaryKey
  int ?id;
  String ?title;
  String ?description;
  String ?date;

  Note(this.id, this.title, this.description, this.date);
}