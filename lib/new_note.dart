
import 'package:flutter/material.dart';
import 'package:flutter_notepad/main.dart';
import 'package:flutter_notepad/note_model.dart';

import 'database.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {

  TextEditingController controller1= TextEditingController();
  TextEditingController controller2= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insert Data"),),
      body: Container(
        height: Size.infinite.height,
        width: Size.infinite.width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextField(
              keyboardType: TextInputType.text,
              controller: controller1,
              decoration: InputDecoration(
              hintText: "Type Tittle",
              border: OutlineInputBorder(),
            ),),
            SizedBox(height: 20,),
            TextField(
              maxLines: 8,
              controller: controller2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Type massage",
                border: OutlineInputBorder(),
              ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async {

              final database = await $FloorMyDatabase.databaseBuilder('app_database.db').build();

              Note note= Note(null, controller1.text, controller2.text, DateTime.now().toString());

              database.noteDao.insertNote(note);

              Navigator.push(context, MaterialPageRoute(builder: (_) => NoteApp()));


            }, child: Text("Save Note"))
          ],
        ),
      ),
    );
  }
}
