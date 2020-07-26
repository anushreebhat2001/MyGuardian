import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myguardian/questions.dart';
import 'questions.dart';

class Quiz extends StatefulWidget {
  static String id = 'quiz';
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white ,
      body: SafeArea(
        child:Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(height * 0.05,height * 0.05,height * 0.05,8),
                child: Text(
                  'DOMESTIC VIOLENCE SCREENING :',
                  style: GoogleFonts.gildaDisplay(
                    letterSpacing: 0.3,
                    fontSize: height * 0.05,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                child: Padding(padding: EdgeInsets.fromLTRB(height * 0.05,8,height * 0.05,height * 0.05),
                  child: Text(
                    'DISCLAIMER: This is a screening measure to help you determine whether you might be involved in an abusive relationship that needs attention. This screening measure is not designed to make a diagnosis or take the place of a professional diagnosis or consultation. For each item, indicate the extent to which it is true, by checking the appropriate box next to the item. ',
                    style: GoogleFonts.gildaDisplay(
                      letterSpacing: 0.2,
                      fontSize: height * 0.02,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: 600.0,
                height: 150.0,
                 child: Padding(padding: EdgeInsets.fromLTRB(height * 0.05,8,height * 0.05,height * 0.05),
                    child: RaisedButton(
                        child: Text('START THE QUIZ',
                      style: GoogleFonts.abel(
                      letterSpacing: 0.2,
                      fontSize: height * 0.02,
                      color: Colors.white,
                        fontWeight: FontWeight.w700,
                    ),
                    ),
                  color: Colors.deepOrange,
                  onPressed:(){
                    Navigator.pushNamed(context, Questions.id);
                  },
              ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}