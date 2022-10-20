import 'package:flutter/material.dart';
import 'package:ms_global_task1/fetch_data/post_data.dart';
import 'package:ms_global_task1/models/post_model.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPostData(),
        builder: (context, snapshot){
        if (snapshot.hasData){
          print("yes");
          return Column(
             children: [
               Expanded(
                 child: ListView.builder(
                     itemCount: postList.length,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                         child: Column(
                           children: [
                             ListTile(
                               title: Text(postList[index].title.toString()),
                               subtitle: Text(postList[index].body.toString()),
                             ),
                             const Divider(
                               thickness: 2.0,
                             ),
                           ],
                         ),
                       );
                     }

                 ),
               ),
             ],
          );
        }
        else {
          print("no");
          return const Center(
              child: Text("Loading...")
          );
        }
        }
        );
  }
}
