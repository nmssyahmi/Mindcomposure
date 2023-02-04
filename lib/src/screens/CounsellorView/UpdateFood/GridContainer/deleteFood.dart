import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteFood extends StatefulWidget {
  @override
  _DeleteFoodState createState() => _DeleteFoodState();
}

class _DeleteFoodState extends State<DeleteFood> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('DeleteFoodPage');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        height: MediaQuery.of(context).size.height * 0.16,
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
            Center(
                child: Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
              size: 90.0,
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Delete Food Fact",
                style: GoogleFonts.workSans(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
