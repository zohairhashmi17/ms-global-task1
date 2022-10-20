import 'package:flutter/material.dart';
import 'package:ms_global_task1/screens/tabs/all_posts.dart';
import 'package:ms_global_task1/screens/tabs/profile.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs>

  with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2,initialIndex: 0, vsync: this)
      ..addListener(() {
        setState(() {

        });
      });
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          controller: _tabController,
          children: [
            AllPosts(),
            Profile()
          ],

        ),
      ),
    );
  }

  AppBar? buildAppBar(){
    return AppBar(
      backgroundColor: const Color(0XFFE43228),
      leading: const Icon(
          Icons.menu
      ),
      title: const Text("Lorep Ipsum"),
      actions: const [
        Icon(
            Icons.search
        ),
        SizedBox(width: 15,)
      ],
      bottom: TabBar(
        controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              child: Text("All Posts"),
            ),
            Tab(
              child: Text("Profile"),
            )
          ]),
    );
  }
}

