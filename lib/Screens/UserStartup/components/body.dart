import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/components/StartupDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
  //     print(firebaseUser);
  //     final String id = firebaseUser.uid;
  //     print(id);
  //     final start = FirebaseFirestore.instance
  //         .collection('Startups')
  //         .where('userId', isEqualTo: id)
  //         .snapshots();
  //     return start;
  //   });
  // }

  // final FirebaseAuth auth = FirebaseAuth.instance;

  // navigateToStartup(DocumentSnapshot startup) {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => StartupDetails(startup)));
  // }

  // Future getData() async {
  //   User user = null;

  //   final uid = user.uid;
  //   print(uid);
  //   final start = FirebaseFirestore.instance
  //       .collection('Startups')
  //       .where('userId', isEqualTo: uid)
  //       .snapshots();
  //   return start;
  // }
  // final auth =  FirebaseAuth.instance.authStateChanges()

  // // auth = FirebaseAuth.instance;

  // print('First');
  // final User user = auth.currentUser();

  // print('Middle');
  // if (user == null) {
  //   await user.reload();
  // }
  // print('reload');
  // print(user);
  // final uid = user.uid;

  // print('Second');

  // print(uid);
  // final start = await FirebaseFirestore.instance
  //     .collection('Startups')
  //     .where('userId', isEqualTo: uid)
  //     .snapshots();
  // return start;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: deprecated_member_use
  FirebaseUser loginUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future getCurrentUser() async {
// HERE I got an Exception "The expression doesn't evaluate to a function, so it can't be invoked."
    final user = await _auth.currentUser;
    if (user != null) {
      loginUser = user;
      print(loginUser.email);
      return loginUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getCurrentUser(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading"),
            );
          } else {
            return Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/main_top.png",
                        width: size.width * 0.20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    // SizedBox(height: size.height * 0.09),
                    Text(
                      "Startup Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 28),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Startup Name: Technogratz',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Webiste: Technogratz.com',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Location: India',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Stage: Started',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'About: A software consultant ',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Competitors: Intel',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),

                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Image.asset(
                        "assets/images/main_bottom.png",
                        width: size.width * 0.4,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
