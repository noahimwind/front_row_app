// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front_row_app/utilities/concerts.dart';
import 'package:front_row_app/utilities/dialog_box.dart';
<<<<<<< Updated upstream
=======
import 'package:front_row_app/pages/profile_page.dart';
import 'package:front_row_app/pages/login_page.dart';
>>>>>>> Stashed changes

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
<<<<<<< Updated upstream
=======
  // routing
  void toProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }
  void toLoginPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
>>>>>>> Stashed changes
  // text controller
  TextEditingController _artistController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _venueController = TextEditingController();

  // list of concerts
  List concertList = [];

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
    Navigator.of(context).pop();
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
        title: Center(
          child: Text(
            'F R O N T  R O W',
          ),
        ),
        leading: IconButton(
          onPressed: () => toLoginPage(context),
          icon: Icon(
            Icons.menu,
          )
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
            )
          )],
        elevation: 0,
        backgroundColor: Colors.indigo,
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