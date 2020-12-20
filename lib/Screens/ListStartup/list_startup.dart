import 'package:flutter/material.dart';
import './components/body.dart';

class ListOfStartups extends StatelessWidget {
  static const routeName = '/all-startups';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
