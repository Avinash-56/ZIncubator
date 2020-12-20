import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/UserStartup/user_startup.dart';
// import 'package:flutter_auth/authentication.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';

import 'package:flutter_auth/components/rounded_input_field.dart';

import 'package:flutter_auth/models/authentication.dart';
import 'package:provider/provider.dart';
import '../../StartupForm/startupForm.dart';
import '../../UserStartup/user_startup.dart';
// class Body extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "LOGIN TO YOUR ACCOUNT",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: size.height * 0.03),
//           SizedBox(height: size.height * 0.03),
//           TextField(
//             controller: emailController,
//             decoration: InputDecoration(
//               labelText: "Email",
//             ),
//           ),
//           TextField(
//             controller: passwordController,
//             decoration: InputDecoration(
//               labelText: "Password",
//             ),
//           ),
//           RoundedButton(
//             text: "LOGIN",
//             press: () {
//               context.read<AuthenticationService>().signIn(
//                     email: emailController.text.trim(),
//                     password: passwordController.text.trim(),
//                   );
//             },
//           ),
//           SizedBox(height: size.height * 0.03),
//           AlreadyHaveAnAccountCheck(
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return SignUpScreen();
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

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
      Navigator.of(context).pushReplacementNamed(StartupForm.routeName);
    } catch (e) {
      var errorMessage = 'Authentication Failed. Try Again';
      _showErrorDialoge(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreenAccent,
                Colors.blue,
              ],
            ),
          ),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 260,
              width: 300,
              padding: EdgeInsets.all(16),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Invalid Email";
                            } else
                              return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password not valid";
                            } else
                              return null;
                          },
                          onSaved: (value) {
                            _authData['password'] = value;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text('Submit'),
                          onPressed: () {
                            submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
