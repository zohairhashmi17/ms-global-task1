
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class User extends ChangeNotifier{

  String email = "";
  String password = "";

  void login(String emailText, String passwordText){
    email = emailText;
    password = passwordText;
    notifyListeners();
  }
}