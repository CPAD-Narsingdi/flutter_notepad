import 'package:flutter/material.dart';
import 'package:flutter_notepad/note_detail.dart';
import 'package:flutter_notepad/note_model.dart';

import 'database.dart';
import 'new_note.dart';

void main() {
  runApp(const MaterialApp(
    home: NoteApp(),
  ));
}

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  List<Note?> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    final database = await $FloorMyDatabase.databaseBuilder('app_database.db').build();

    dataList= [];
    database.noteDao.getAllData().then((value) {
      setState(() {
        dataList=value;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Notepad"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => NewNote()));
        },
        child: Icon(Icons.note_add_outlined),
      ),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ListTile(
                onTap: () async {
                  Note? note= dataList[index];

                  Navigator.push(context, MaterialPageRoute(builder: (_) => NoteDetails(note!)));
                },
                title: Text(
                  dataList[index]!.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(dataList[index]!.description.toString()),
                trailing: IconButton(
                  onPressed: () async {
                    var database = await $FloorMyDatabase.databaseBuilder('app_database.db').build();

                    var note=  dataList[index];
                    database.noteDao.deleteNote(note!);
                    fetchAllData();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
