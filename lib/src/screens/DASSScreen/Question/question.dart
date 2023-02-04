import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/constants.dart';
import 'package:mindcomposure/src/model/DASSQuestion.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  final Question question;
  final Function callback;

  QuestionWidget({
    @required this.index,
    @required this.question,
    @required this.callback,
  });

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
        color: Color.fromARGB(250, 218, 200, 182),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.question.text,
            style: GoogleFonts.ptSerif(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: answers
                .map(
                  (e) => Row(
                    children: <Widget>[
                      Radio(
                        value: e.value,
                        activeColor: Colors.blue,
                        groupValue: widget.question.score,
                        onChanged: (value) {
                          widget.callback(widget.index, value);
                        },
                      ),
                      Text(
                        e.text,
                        style: GoogleFonts.ptSerif(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
