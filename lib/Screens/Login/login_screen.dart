import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login To Your Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
