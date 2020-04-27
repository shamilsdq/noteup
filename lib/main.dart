import 'package:flutter/material.dart';
import 'package:noteup/pages/home.dart';


void main() => runApp(NoteUp());

class NoteUp extends StatelessWidget {
		@override
		Widget build(BuildContext context) {
				return MaterialApp(
						title: 'NoteUp',
						debugShowCheckedModeBanner: false,
						home: Home(),
				);
		}
}