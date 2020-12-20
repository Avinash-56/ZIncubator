import 'package:flutter/material.dart';
import './background.dart';
import '../../../components/startup_multiple_input.dart';

import '../../../components/startup_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = '';
  String website = '';
  String about = '';
  String location = '';
  String status = '';
  String competitors = '';
  String apply = '';

  void createRecord() {
    if (name == null ||
        website == null ||
        about == null ||
        location == null ||
        status == null ||
        competitors == null ||
        apply == null) {
      return;
    } else {
      FirebaseFirestore.instance.collection('Startups').add({
        'name': name,
        'website': website,
        'about': about,
        'location': location,
        'status': status,
        'competitors': competitors,
        'apply': apply
      });
      print(';Hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          SizedBox(height: size.height * 0.05),
          Text(
            "Input your startup detials",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 24),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(height: size.height * 0.03),
          StartupInputField(
            hintText: "Startup Name",
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          StartupInputField(
            hintText: "Website Link",
            onChanged: (value) {
              setState(() {
                website = value;
              });
            },
          ),
          StartupInputField(
            hintText: "About your company ",
            onChanged: (value) {
              setState(() {
                about = value;
              });
            },
          ),
          StartupInputField(
            hintText: "Location of your company",
            onChanged: (value) {
              setState(() {
                location = value;
              });
            },
          ),
          StartupInputField(
            hintText: "How far along are you",
            onChanged: (value) {
              setState(() {
                status = value;
              });
            },
          ),
          StartupInputField(
            hintText: "Who are your competitors",
            onChanged: (value) {
              setState(() {
                competitors = value;
              });
            },
          ),
          StartupInputField(
            hintText: "Why did you apply here?",
            onChanged: (value) {
              setState(() {
                apply = value;
              });
            },
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              // submit();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.blueAccent,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
