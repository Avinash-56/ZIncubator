import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Screens/StartupForm/startupForm.dart';
// import 'package:flutter_auth/Screens/users/dashboard.dart';
import 'package:flutter_auth/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService with ChangeNotifier {
  // final FirebaseAuth _firebaseAuth;

  AuthenticationService();

  Future<void> signIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBRZ5oKmWHyU0wJ2k_pPW9scU5BDiEpsy0';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (e) {
      throw e.message;
    }
  }

  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBRZ5oKmWHyU0wJ2k_pPW9scU5BDiEpsy0';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (e) {
      throw e.message;
      ;
    }
  }
}
