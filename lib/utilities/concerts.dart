import 'package:flutter/material.dart';

class Concerts extends StatelessWidget {

  final String artistName;
  final String date;
  final String venue;

  Concerts({
    super.key,
    required this.artistName,
    required this.date,
    required this.venue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Container(
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Text(date),
            const SizedBox(width: 20),
            Container(
              child: Column(
                children: [
                  Text(artistName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(venue)
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}