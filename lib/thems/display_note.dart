import 'package:appghichu/db/database_provider.dart';
import 'package:appghichu/model/note_model.dart';
import 'package:flutter/material.dart';

class ShowNote extends StatefulWidget {
  const ShowNote({Key key}) : super(key: key);

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context).settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ghi chú"),

        //delete

        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DatabaseProvider.db.deleteNote(note.id);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              note.body,
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
