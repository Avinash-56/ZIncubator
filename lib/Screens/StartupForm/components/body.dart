import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../components/startup_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  DateTime selectedDate;
  String founders = '';

  void createRecord() {
    if (name == '' ||
        website == '' ||
        about == '' ||
        location == '' ||
        status == '' ||
        competitors == '' ||
        apply == '') {
      return;
    } else {
      // final FirebaseAuth auth = FirebaseAuth.instance;

      // final User user = auth.currentUser;
      // final uid = user.uid;
      FirebaseFirestore.instance.collection('Startups').add({
        'name': name,
        'website': website,
        'about': about,
        'location': location,
        'status': status,
        'competitors': competitors,
        'apply': apply,
        'foundedOn': selectedDate,
        'founders': founders
      });
      setState(() {
        name = '';
        website = '';
        about = '';
        location = '';
        status = '';
        competitors = '';
        apply = '';
      });

      // print('Hello');
    }
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime d = await showDatePicker(
  //     //we wait for the dialog to return
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2020),
  //   );
  //   if (d != null) //if the user has selected a date
  //     setState(() {
  //       // we format the selected date and assign it to the state variable
  //       selectedDate = new DateFormat.yMMMMd("en_US").format(d);
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white60,
            Colors.white12,
          ],
        ),
      ),
      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Number of founders',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new DropdownButton<String>(
                  items: <String>['1', '2', '3', '>=4'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (fs) {
                    setState(() {
                      founders = fs;
                    });
                  },
                ),
              ],
            ),
            FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2021, 1, 1),
                      onChanged: (date) {}, onConfirm: (date) {
                    setState(() {
                      selectedDate = date;
                      print(selectedDate);
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'Founded on (English)',
                  style: TextStyle(color: Colors.black87),
                )),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                createRecord();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
