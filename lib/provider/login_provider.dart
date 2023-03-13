// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _obsecure = false;
  bool get obsecure => _obsecure;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  setobsecure(value) {
    _obsecure = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        setLoading(false);
        print("Successfull");
      } else {
        print("Failed");
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
