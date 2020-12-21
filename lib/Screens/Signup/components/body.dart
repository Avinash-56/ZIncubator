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
import '../../StartupForm/startupForm.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {'email': '', 'password': ''};

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
      await Provider.of<AuthenticationService>(context, listen: false).signIn(
        _authData['email'],
        _authData['password'],
      );
      Navigator.of(context).pushReplacementNamed(UserStartup.routeName);
    } catch (e) {
      var errorMessage = 'Authentication Failed. Try Again';
      _showErrorDialoge(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return Stack(
    //   children: <Widget>[
    //     Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [
    //             Colors.lightGreenAccent,
    //             Colors.blue,
    //           ],
    //         ),
    //       ),
    //     ),
    //     Center(
    //       child: Card(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Container(
    //           height: 260,
    //           width: 300,
    //           padding: EdgeInsets.all(16),
    //           child: Form(
    //               key: _formKey,
    //               child: SingleChildScrollView(
    //                 child: Column(
    //                   children: <Widget>[
    //                     TextFormField(
    //                       decoration: InputDecoration(labelText: 'Email'),
    //                       keyboardType: TextInputType.emailAddress,
    //                       validator: (value) {
    //                         if (value.isEmpty) {
    //                           return "Invalid Email";
    //                         } else
    //                           return null;
    //                       },
    //                       onSaved: (value) {
    //                         _authData['email'] = value;
    //                       },
    //                     ),
    //                     TextFormField(
    //                       decoration: InputDecoration(labelText: 'Password'),
    //                       obscureText: true,
    //                       keyboardType: TextInputType.emailAddress,
    //                       validator: (value) {
    //                         if (value.isEmpty) {
    //                           return "Password not valid";
    //                         } else
    //                           return null;
    //                       },
    //                       onSaved: (value) {
    //                         _authData['password'] = value;
    //                       },
    //                     ),
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     RaisedButton(
    //                       child: Text('Submit'),
    //                       onPressed: () {
    //                         submit();
    //                       },
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       color: Colors.blueAccent,
    //                       textColor: Colors.white,
    //                     ),
    //                     AlreadyHaveAnAccountCheck(
    //                       press: () {
    //                         Navigator.of(context)
    //                             .pushReplacementNamed(SignUpScreen.routeName);
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               )),
    //         ),
    //       ),
    //     )
    //   ],
    // );
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
            // RoundedPasswordField(
            //   validator: (value) {
            //     if (value != _authData['password']) {
            //       return "Password do not match";
            //     } else
            //       return null;
            //   },
            // ),
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
