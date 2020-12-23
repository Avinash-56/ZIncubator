import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/UserStartup/user_startup.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';

import 'package:flutter_auth/models/authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../StartupForm/startupForm.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

String getEmail = '';

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {'email': '', 'password': ''};
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Timer(
  //         Duration(seconds: 1),
  //         () => Navigator.pushReplacement(context, MaterialPageRoute(
  //               builder: (context) {
  //                 return getEmail == null ? LoginScreen() : StartupForm();
  //               },
  //             )));
  //   });
  //   super.initState();
  // }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var preEmail = sharedPreferences.getString('email');
    setState(() {
      getEmail = preEmail;
    });
  }

  void _showErrorDialoge(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    try {
      await Provider.of<AuthenticationService>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],
      );
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('email', _authData['email']);
      Navigator.of(context).pushReplacementNamed(StartupForm.routeName);
    } catch (e) {
      var errorMessage = 'Authentication Failed. Try Again';
      _showErrorDialoge(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onSaved: (value) {
                _authData['email'] = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Email not valid";
                } else
                  return null;
              },
            ),
            RoundedPasswordField(
              onSaved: (value) {
                _authData['password'] = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Password not valid";
                } else
                  return null;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                submit();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
