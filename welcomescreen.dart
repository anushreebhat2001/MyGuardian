import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myguardian/Getstarted.dart';
import 'package:myguardian/rounded_button.dart';
class Welcomescreen extends StatefulWidget {
  static String id = 'Welcomescreen';
  @override
  _WelcomescreenState createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
       width: width,
        height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.orange, Colors.deepPurple])),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: height*0.1),
                  Text ('Welcome to MyGuardian',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.gildaDisplay(
                      fontSize: height * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                  Text ('\nYour personal pocket guardian, one click to get you help, before anyone makes you welp\n',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.gildaDisplay(
                        fontSize: height * 0.02,
                        color: Colors.white,)
                  ),

                 RoundedButton(
              title: 'Get Started',
                colour: Colors.white70,
                onPressed: () {
                  Navigator.pushNamed(context, Getstarted.id);
                },
              ),
              ],
                ),
              ),
          ),
        ),
    );
  }
}