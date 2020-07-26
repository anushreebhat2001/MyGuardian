import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';

class Forgot extends StatefulWidget {
  static String id = 'Forgot';
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
 final _auth = FirebaseAuth.instance;
 String email;

@override
Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    resizeToAvoidBottomPadding: false,
    backgroundColor: Colors.white,
    body: SafeArea(
      child:Form(
         child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Text(
              'Password Reset',
              style: GoogleFonts.gildaDisplay(
                letterSpacing: 0.5,
                fontSize: height * 0.05,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            child: Padding(padding: EdgeInsets.all(height * 0.05),
              child: Text(
                'To reset your password a link will be sent to the registered email id : ',
                style: GoogleFonts.gildaDisplay(
                  letterSpacing: 0.5,
                  fontSize: height * 0.02,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: TextField(
              style: GoogleFonts.abel(
                letterSpacing: 4.0,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),

          Center(
            child: RoundedButton(
              colour: Colors.deepOrange,
              title: 'Send Link',
              onPressed: (){}
            ),
          ),
            ],
          ),
      ),
    ),
  );
}
}