import 'package:myguardian/loginscreen.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myguardian/google.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map((FirebaseUser user) => user?.uid,);
  String email;
  String password;
  String name;
  String phone;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Text(
                'Register',
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
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Lets get \nyou on board',
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
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
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
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                  hintText: 'Phone number',
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
            Center(
              child: RoundedButton(
                colour: Colors.deepOrange,
                title: 'Register',
                onPressed: () async {
                  try {
                    final newUser =
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      showAlertDialog(context);

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
                    style: GoogleFonts.abel(
                      letterSpacing: 2.0,
                    ),
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
                      signInWithGoogle().whenComplete(()   {
                        showAlertDialog(context);
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
////                    initiateFacebookLogin();
//                  },
//                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: GoogleFonts.abel(
                    letterSpacing: 2.0,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Sign In',
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
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Registration Successful"),
    content: Text("Your registration is complete."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}