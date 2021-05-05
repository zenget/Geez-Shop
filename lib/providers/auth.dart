import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    const url = 'identitytoolkit.googleapis.com';

    final response = await http.post(
        Uri.https(url, '/v1/accounts:signUp',
            {'key': 'AIzaSyBk_GxSQZpbELcbqijFD6sS5EveGCHZo7c'}),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));

    print(response.request.url);
    print(response.body);
  }
}
