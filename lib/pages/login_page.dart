import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton=false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/login.png",fit: BoxFit.cover),
            SizedBox(height: 20,),
            Text("Welcome, $name",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: 'Username',
                    ),
                    onChanged: (value){
                      name=value;
                      setState((){});
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: 'Password',

                    ),
                  ),
                  SizedBox(height: 40,),
                  // ElevatedButton(
                  //   style: TextButton.styleFrom(minimumSize: Size(150,40)),
                  //   onPressed: (){
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  // )
                  InkWell(
                    onTap: ()async{
                      //Navigator.pushNamed(context, MyRoutes.homeRoute);
                      setState((){
                        changeButton=true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton?50:150,
                      height: 50,
                      alignment: Alignment.center,
                      //color: Colors.blue,
                      //color: Colors.blue,
                      child: changeButton
                          ?Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                          :Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),

                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        // shape: changeButton
                        //   ? BoxShape.circle
                        //   : BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(changeButton?50:8)

                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
