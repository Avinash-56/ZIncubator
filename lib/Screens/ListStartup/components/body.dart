import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/components/StartupDetails.dart';
import './background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future getStartups() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('Startups').get();
    return qn.docs;
  }

  navigateToStartup(DocumentSnapshot startup) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StartupDetails(startup)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: FutureBuilder(
          future: getStartups(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading"),
              );
            } else {
              return Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        onTap: () => navigateToStartup(snapshot.data[index]),
                        title: Text(
                          snapshot.data[index].data()['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.black12,
                              color: Colors.pink[900]),
                        ),
                      );
                    },
                  ));
            }
          }),
    );
  }
}
