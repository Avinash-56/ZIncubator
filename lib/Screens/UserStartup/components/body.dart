import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/components/StartupDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../../../models/authentication.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<String> getUserId() async {
    try {
      print('First');
      final id =
          await Provider.of<AuthenticationService>(context, listen: false)
              .getCurrentUID();

      print(id);

      return id;
    } catch (e) {
      throw e.message;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  getCurrentUser() async {
    final User user = _auth.currentUser;
    final uid = user.uid;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(uid);
    //print(uemail);
  }

  // ignore: deprecated_member_use
  FirebaseUser loginUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

//   Future getCurrentUser() async {
// // HERE I got an Exception "The expression doesn't evaluate to a function, so it can't be invoked."

//     final user = await _auth.currentUser;
//     if (user != null) {
//       loginUser = user;
//       print(loginUser.email);
//       return loginUser;
//     }
//   }

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
                  Text(snapshot.data),
                  //   Positioned(
                  //     top: 0,
                  //     left: 0,
                  //     child: Image.asset(
                  //       "assets/images/main_top.png",
                  //       width: size.width * 0.20,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   // SizedBox(height: size.height * 0.09),
                  //   Text(
                  //     "Startup Details",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.purple,
                  //         fontSize: 28),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'Startup Name: Technogratz',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'Webiste: Technogratz.com',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'Location: India',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'Stage: Started',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'About: A software consultant ',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.03),
                  //   Text(
                  //     'Competitors: Intel',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  //   SizedBox(height: size.height * 0.08),

                  //   Positioned(
                  //     bottom: 10,
                  //     right: 0,
                  //     child: Image.asset(
                  //       "assets/images/main_bottom.png",
                  //       width: size.width * 0.4,
                  //     ),
                  //   ),
                ],
              )),
            );
          }
        });
  }
}
