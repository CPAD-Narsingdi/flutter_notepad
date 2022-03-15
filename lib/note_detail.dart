
import 'package:flutter/material.dart';
import 'package:flutter_notepad/note_model.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails(this.note, {Key? key}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Details"),),
      body: Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(note.title!),
            Text(note.description!),
            Text(note.date!),
          ],
        ),
      ),
    );
  }
}
