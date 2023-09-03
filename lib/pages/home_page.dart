import 'package:flutter/material.dart';
import 'package:front_row_app/utilities/concerts.dart';
import 'package:front_row_app/utilities/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  TextEditingController _artistController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _venueController = TextEditingController();

  // list of concerts
  List concertList = [
    ["NOV 20", "Ski Aggu", "Köln"],
    ["DEC 02", "Ritter Lean", "Düsseldorf"],
    ["DEC 13", "01099", "Frankfurt am Main"],
  ];

  //save new concert
  void saveNewConcert() {
    setState(() {
      String date = _dateController.text;
      String artistName = _artistController.text;
      String venue = _venueController.text;
      concertList.add([date, artistName, venue]);
      _dateController.clear();
      _artistController.clear();
      _venueController.clear();
    });
  }

  // create new concert
  void createNewConcert() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          dateController: _dateController,
          artistController: _artistController,
          venueController: _venueController,
          onSave: saveNewConcert,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('Concerts'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewConcert,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: concertList.length,
        itemBuilder: (context, index) {
          return Concerts(
            date: concertList[index][0],
            artistName: concertList[index][1],
            venue: concertList[index][2]);
        }
      ),
    );
  }
}