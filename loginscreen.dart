import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myguardian/RegistrationScreen.dart';
import 'package:myguardian/quiz.dart';
import 'rounded_button.dart';
import 'package:myguardian/google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotpassword.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Text(
                'Login',
                style: GoogleFonts.gildaDisplay(
                  letterSpacing: 0.5,
                  fontSize: height * 0.05,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              width: width * 0.8,
              child: Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Text(
                  'Welcome back, \nplease login \nto your account',
                  style: GoogleFonts.gildaDisplay(
                    letterSpacing: 0.5,
                    fontSize: height * 0.038,
                    color: Colors.black54,
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
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: TextField(
                style: GoogleFonts.abel(
                  letterSpacing: 4.0,
                ),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context,Forgot.id);
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.abel(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            Center(
              child: RoundedButton(
                colour: Colors.deepOrange,
                title: 'Login',
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, Quiz.id);
                      print("login successful");
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: width * 0.1,
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    'Or',
                    style: GoogleFonts.abel(),
                  ),
                ),
                SizedBox(
                  width: width * 0.1,
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  disabledColor: Colors.white,
                  color: Colors.white,
                  elevation: 0.0,
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.07,
                    child: Center(
                      child: Text(
                        'Google',
                        style: GoogleFonts.abel(
                          letterSpacing: 5.0,
                          fontSize: height * 0.02,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    try {
                      signInWithGoogle().whenComplete(() {
                        Navigator.pushReplacementNamed(context, Quiz.id);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
//                SizedBox(
//                  width: width * 0.1,
//                ),
//                RaisedButton(
//                  shape: RoundedRectangleBorder(
//                    side: BorderSide(color: Colors.black12),
//                    borderRadius: BorderRadius.circular(7.0),
//                  ),
//                  disabledColor: Colors.white,
//                  color: Colors.white,
//                  elevation: 0.0,
//                  child: Container(
//                    width: width * 0.3,
//                    height: height * 0.07,
//                    child: Center(
//                      child: Text(
//                        'Facebook',
//                        style: GoogleFonts.abel(
//                          letterSpacing: 5.0,
//                          fontSize: height * 0.02,
//                          color: Colors.black54,
//                        ),
//                      ),
//                    ),
//                  ),
//                  onPressed: () {
//                    initiateFacebookLogin();
//                  },
//                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.abel(
                    letterSpacing: 2.0,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RegistrationScreen.id);
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.abel(
                      letterSpacing: 2.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}