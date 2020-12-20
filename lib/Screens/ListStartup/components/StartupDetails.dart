import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StartupDetails extends StatefulWidget {
  final DocumentSnapshot startup;

  StartupDetails(this.startup);
  @override
  _StartupDetailsState createState() => _StartupDetailsState();
}

class _StartupDetailsState extends State<StartupDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final stat = widget.startup.data();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.05),
            Text(
              "Starup Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 24),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Text(stat['name']),
            Text(
              stat['website'],
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Loaction: ${stat['location']}',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              stat['status'],
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              stat['about'],
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              stat['competitors'],
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
