import 'package:flutter/material.dart';
import './components/body.dart';

class StartupForm extends StatelessWidget {
  static const routeName = '/startup-form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
