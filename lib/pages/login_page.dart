// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:front_row_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void toHomepage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: 
              AssetImage('assets/front_row_logo.PNG'),
                width: 150,
              ),
          SizedBox(height: 15),
          // hello again
          Text(
            'Willkommen zurück!',
            style: GoogleFonts.bebasNeue(
              fontSize: 50
            )
          ),
          SizedBox(height: 5),
          Text(
            'Wir haben dich schon vermisst.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 40),

          // email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.indigo),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),

          // password textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.indigo),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Passwort',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),

          // sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12)
                ),
              child: Center(
                child: Text(
                  'Einloggen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                )
              ),
            ),
          ),
          SizedBox(height: 20),

          // not a member - register button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Noch kein Konto? '),
              Text(
                'Jetzt registrieren.',
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: 20),

          // Gast - vorrübergehend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () => toHomepage(context),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12)
                  ),
                child: Center(
                  child: Text(
                    'Als Gast fortfahren',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ],),
        )
      ),
    );
  }
}