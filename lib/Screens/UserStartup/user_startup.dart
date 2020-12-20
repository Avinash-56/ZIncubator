import 'package:flutter/material.dart';
import './components/body.dart';

class UserStartup extends StatelessWidget {
  static const routeName = '/user-startup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
