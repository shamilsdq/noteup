import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteup/models/note.dart';
import 'package:noteup/pages/edit.dart';
import 'package:noteup/service/db.dart';
import 'package:noteup/widgets/loading.dart';


class Home extends StatefulWidget {
		@override
		HomeState createState() => HomeState();
}


class HomeState extends State<Home> {

		List<Note> notes;
		bool loading = true;

		@override
		void initState() {
				super.initState();
				refresh();
		}

		@override
		Widget build(BuildContext context) {
				return Scaffold(
						appBar: AppBar(
								title: Text('NOTES'),
						),
						floatingActionButton: FloatingActionButton(
								child: Icon(Icons.add),
								onPressed: () {
										setState(() => loading = true);
										Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(note: new Note()))).then((v) {
												refresh();
										});
								},
						),
						body: loading? Loading() : ListView.builder(
								padding: EdgeInsets.all(5.0),
								itemCount: notes.length,
								itemBuilder: (context, index) {
										Note note = notes[index];
										return Card(
												color: Colors.white70,
												child: ListTile(
														title: Text(note.title),
														subtitle: Text(
																note.content,
																maxLines: 2,
																overflow: TextOverflow.ellipsis,
														),
														onTap: () {
																setState(() => loading = true);
																Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(note: note))).then((v) {
																		refresh();
																});
														},
												),
										);
								},
						),
				);
		}


		Future<void> refresh() async {
				notes = await DB().getNotes();
				setState(() => loading = false);
		}

}