import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/IncubatorLogin/incubator_login_screen.dart';
import 'package:flutter_auth/Screens/ListStartup/list_startup.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/StartupForm/startupForm.dart';
import 'package:flutter_auth/Screens/UserStartup/user_startup.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './models/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthenticationService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Z Combinator',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
        routes: {
          WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          IncubatorLoginScreen.routeName: (ctx) => IncubatorLoginScreen(),
          UserStartup.routeName: (ctx) => UserStartup(),
          ListOfStartups.routeName: (ctx) => ListOfStartups(),
          StartupForm.routeName: (ctx) => StartupForm()
        },
      ),
    );
  }
}
