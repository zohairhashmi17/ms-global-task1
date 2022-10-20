import 'package:flutter/material.dart';
import 'package:ms_global_task1/providers/user.dart';
import 'package:ms_global_task1/screens/tabs/tabs.dart';
import 'package:ms_global_task1/widgets/button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
            Image(
                image: AssetImage("assets/logo.jfif"),
                height: 150,
            ),
          SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[300],
                hintText: "Email",
              ),
              validator: (value){
                if (value!.isEmpty){
                  return "Please enter your email";
                }
                else{
                  return null;
                }
              },
            ),
          SizedBox(height: 20,),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              hintText: "Password",
              suffixIcon: Icon(Icons.visibility)
            ),
            validator: (value){
              if (value!.isEmpty){
                return "Please enter your password";
              }
              else{
                return null;
              }
            },
          ),
          SizedBox(height: 20,),
          MyButton(
              text: "LOGIN",
              color: Color(0XFFE43228),
            onTap: () async{
                
                Provider.of<User>(context,listen: false).
                login(emailController.text.toString(),
                    passwordController.text.toString());
                
                if (_formkey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyTabs()));
                  setState(() {
                  });
                }
            },
          )
      ],
    ),
          ),
        )
    );
  }
}
