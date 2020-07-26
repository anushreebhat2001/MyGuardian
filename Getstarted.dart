import 'package:flutter/material.dart';
import 'package:myguardian/RegistrationScreen.dart';
import 'package:myguardian/loginscreen.dart';
import 'rounded_button.dart';

class Getstarted extends StatefulWidget {
  static String id = 'Getstarted';
  @override
  _GetstartedState createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [Colors.deepOrange, Colors.deepPurple])),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RoundedButton(
                  title: 'Login',
                  colour: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  colour: Colors.white,
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RegistrationScreen.id);

                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}