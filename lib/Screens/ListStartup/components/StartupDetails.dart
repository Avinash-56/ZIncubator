import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './background2.dart';

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
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Image.asset(
            //     "assets/images/main_top.png",
            //     width: size.width * 0.20,
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            // SizedBox(height: size.height * 0.09),
            Text(
              "Starup Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 28),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Text(
              'Startup Name:  ${stat['name']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Webiste: ${stat['website']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Location: ${stat['location']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Stage: ${stat['status']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'About: ${stat['about']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Competitors:  ${stat['competitors']}',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            SizedBox(height: size.height * 0.08),
          ],
        ),
      ),
    );
  }
}
