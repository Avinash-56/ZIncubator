import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/components/StartupDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
  }

  navigateToStartup(DocumentSnapshot startup) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StartupDetails(startup)));
  }

  Future getData() async {
    final User user = await FirebaseAuth.instance.currentUser;
    final start = FirebaseFirestore.instance
        .collection('Startups')
        .where('userIfd', isEqualTo: user.uid)
        .snapshots();
    return start;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: FutureBuilder(
          future: getData(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Loading"),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    var id = inputData();
                    print(id);
                    return ListTile(
                      onTap: () => navigateToStartup(snapshot.data[index]),
                      title: Text(
                        snapshot.data['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
