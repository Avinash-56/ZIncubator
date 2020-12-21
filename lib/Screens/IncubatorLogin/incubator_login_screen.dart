import 'package:flutter/material.dart';
import './components/body.dart';

class IncubatorLoginScreen extends StatelessWidget {
  static const routeName = '/incubator-login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Incubator...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
