import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ms_global_task1/models/users_model.dart';

List<Users> userList = [];
Future<List<Users>> fetchUserData() async{
  String userApiUrl = "https://jsonplaceholder.typicode.com/users";
  final response = await http.get(Uri.parse(userApiUrl));
  var data = jsonDecode(response.body.toString());
  userList.clear();
  if (response.statusCode == 200) {
    for (Map i in data) {
      userList.add(Users.fromJson(i));
    }
    return userList;
  }
  else {
    throw Exception('Failed to load');
  }
}
