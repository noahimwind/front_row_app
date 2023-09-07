import 'package:flutter/material.dart';
import 'package:front_row_app/utilities/buttons.dart';
import 'package:intl/intl.dart';

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
              controller: venueController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Venue",
              ),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today_rounded),
                labelText: "Select Date",
                border: OutlineInputBorder(),
                //hintText: "Date",
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2100)
                );
                if(pickeddate != null) {
                  String formattedDate = DateFormat('dd.MM.yyyy').format(pickeddate);
                  dateController.text = formattedDate;
                }
              },
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