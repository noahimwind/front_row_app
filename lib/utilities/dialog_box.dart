import 'package:flutter/material.dart';
import 'package:front_row_app/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController artistController;
  final TextEditingController venueController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.dateController,
    required this.artistController,
    required this.venueController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[200],
      content: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Add new Concert"),
            // user input
            TextField(
              controller: artistController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Artist",
              ),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Date",
              ),
            ),
            TextField(
              controller: venueController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Venue",
              ),
            ),
            // save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButtons(text: "Save", onPressed: onSave),
                const SizedBox(width: 8),
                //cancel
                MyButtons(text: "Cancel", onPressed: onCancel),
              ],
            )
          ]
        ),
      ),
    );
  }
}