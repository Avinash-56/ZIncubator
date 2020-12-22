import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/IncubatorLogin/incubator_login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './components/body.dart';

class ListOfStartups extends StatelessWidget {
  static const routeName = '/all-startups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.brown[300],
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('adminEmail');
            },
          )
        ],
      ),
      body: Body(),
    );
  }
}
