import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ListStartup/list_startup.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/StartupForm/startupForm.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../IncubatorLogin/incubator_login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Z Combinator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.red,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            RoundedButton(
                text: "INCUBATOR?",
                press: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final email = sharedPreferences.getString('adminEmail');
                  print(email);
                  Timer(
                      Duration(seconds: 3),
                      () => Navigator.of(context).pushNamed(email == null
                          ? IncubatorLoginScreen.routeName
                          : ListOfStartups.routeName));
                }),
            SizedBox(height: size.height * 0.005),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                final email = sharedPreferences.getString('email');
                print(email);
                Timer(
                    Duration(seconds: 3),
                    () => Navigator.of(context).pushNamed(email == null
                        ? LoginScreen.routeName
                        : StartupForm.routeName));
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                final email = sharedPreferences.getString('email');
                print(email);
                Timer(
                    Duration(seconds: 3),
                    () => Navigator.of(context).pushNamed(email == null
                        ? SignUpScreen.routeName
                        : StartupForm.routeName));
              },
            ),
          ],
        ),
      ),
    );
  }
}
