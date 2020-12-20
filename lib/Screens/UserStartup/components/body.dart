import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/components/StartupDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Future getStartup() async {
  //   // final FirebaseAuth auth = FirebaseAuth.instance;

  //   // final User user = auth.currentUser;
  //   // final uid = user.uid.toString();
  //   // print(uid);
  //   // here you write the codes to input the data into firestore
  //   var firestore = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await firestore.collection('Startups').get();
  //   return qn.docs;
  // }

  Future getStartup() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('Startups').get();
    return qn.docs;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future inputData() async {
    final User user = await auth.currentUser;
    final uid = user.uid;
    return uid;
    // here you write the codes to input the data into firestore
  }

  navigateToStartup(DocumentSnapshot startup) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StartupDetails(startup)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: FutureBuilder(
          future: getStartup(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading"),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    var id = inputData();
                    print(id);

                    if (snapshot.data[index].data()['userId'] == inputData()) {
                      return ListTile(
                        onTap: () => navigateToStartup(snapshot.data[index]),
                        title: Text(
                          snapshot.data[index].data()['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      );
                    }
                  });
            }
          }),
    );
  }
}
