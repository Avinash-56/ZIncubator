import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/IncubatorLogin/incubator_login_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';

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
              "STARTUP ZZZ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: 150,
              height: 60,
              child: RaisedButton(
                color: Colors.indigo,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: 150,
              height: 60,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  // submit();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: 150,
              height: 60,
              child: RaisedButton(
                color: Colors.purple,
                child: Text(
                  'Incubator?',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  // submit();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return IncubatorLoginScreen();
                      },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
