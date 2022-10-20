import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ms_global_task1/models/post_model.dart';

List<Posts> postList = [];
Future<List<Posts>> fetchPostData() async{
  String postApiUrl = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(postApiUrl));
  var data = jsonDecode(response.body.toString());
  postList.clear();
  if (response.statusCode == 200) {
    for (Map i in data) {
      postList.add(Posts.fromJson(i));
    }
    return postList;
  }
  else {
    throw Exception('Failed to load');
  }
}
