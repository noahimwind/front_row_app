import 'package:flutter/material.dart';
import 'package:front_row_app/utilities/concerts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // list of concerts
  List concertList = [
    ["NOV 20", "Ski Aggu", "Köln"],
    ["DEC 02", "Ritter Lean", "Düsseldorf"],
    ["DEC 13", "01099", "Frankfurt am Main"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('Concerts'),
        elevation: 0,
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