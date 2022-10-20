import 'package:flutter/material.dart';
import 'package:ms_global_task1/fetch_data/user_data.dart';
import 'package:ms_global_task1/providers/user.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {


  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUserData(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                      itemBuilder: (context,index){
                      return Consumer<User>(builder: (context, value, child) {
                        if(value.email.toString()==userList[index].email.toString()
                        && value.password.toString()==userList[index].username.toString()){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(userList[index].name.toString())
                                      ],
                                    ),
                              ),

                              const Divider(
                                thickness: 2.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Username",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(userList[index].username.toString())
                                      ],
                                    ),

                              ),
                              const Divider(
                                thickness: 2.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Address",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(userList[index].address!.street.toString()),
                                            Text(userList[index].address!.city.toString()),
                                          ],
                                        )
                                      ],
                                    ),
                              ),
                              const Divider(
                                thickness: 2.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Zipcode",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(userList[index].address!.zipcode.toString())
                                      ],
                                    ),
                              ),
                              const Divider(
                                thickness: 2.0,
                              ),
                            ],
                          );
                        }
                        else{
                          return Container();
                        }

                      });

                      }
                      ),
                ),
              ],
            );
          }
          else {
            return const Center(
                child: Text("Loading...")
            );
          }
        }
    );


  }
}
