import 'package:flutter/material.dart';
import 'package:mindcomposure/src/widgets/TreatmentNavyWidget/HorizontalFood.dart';
import 'package:mindcomposure/src/widgets/TreatmentNavyWidget/HorizontalBreath.dart';
import 'package:mindcomposure/src/widgets/TreatmentNavyWidget/HorizontalPhoto.dart';
import 'package:mindcomposure/src/widgets/TreatmentNavyWidget/HorizontalYoga.dart';

class ListTreatment extends StatefulWidget {
  @override
  _ListTreatmentState createState() => _ListTreatmentState();
}

class _ListTreatmentState extends State<ListTreatment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            HorizontalBreathing(),
            HorizontalYoga(),
            HorizontalFood(),
            HorizontalPhoto(),
          ],
        ),
      ),
    );
  }
}
