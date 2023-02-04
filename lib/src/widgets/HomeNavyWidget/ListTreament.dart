import 'package:flutter/material.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerBreath.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerFood.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerPhoto.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerYoga.dart';

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
        child: Row(
          children: [
            ContainerScroll(),
            ContainerScroll2(),
            ContainerScroll3(),
            ContainerScroll4(),
          ],
        ),
      ),
    );
  }
}
