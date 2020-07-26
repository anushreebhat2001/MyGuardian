import 'package:myguardian/RegistrationScreen.dart';
import 'package:myguardian/loginscreen.dart';
import 'package:myguardian/quiz.dart';
import 'package:myguardian/welcomescreen.dart';
import 'package:myguardian/Getstarted.dart';
import 'package:flutter/material.dart';
import 'forgotpassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        Welcomescreen.id:(context)=>Welcomescreen(),
        Getstarted.id:(context)=>Getstarted(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        Forgot.id:(context)=>Forgot(),
        Quiz.id:(context)=>Quiz(),
      },
      initialRoute: Welcomescreen.id,
    );
  }
}
