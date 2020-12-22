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
    final double elevation = 3;
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
            // SizedBox(height: size.height * 0.03),
            // SizedBox(height: size.height * 0.09),
            Card(
              elevation: elevation,
              child: Row(
                children: [
                  Expanded(
                    child: Icon(Icons.assignment),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Starup Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 32),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Startup Name:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['name']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Website:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['website']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Location:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['location']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Stage:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['status']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'About:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['about']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.07),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Competitors:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    ' ${stat['competitors']}',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.08),
          ],
        ),
      ),
    );
  }
}
