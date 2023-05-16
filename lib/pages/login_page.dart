import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton=false;
  final _formKey=GlobalKey<FormState>();
  final passwordController=TextEditingController();
  final usernameController=TextEditingController();
  moveToHome(BuildContext context) async{
    if(usernameController!=null && passwordController!=null) {
      setState((){
        changeButton=true;
      });
      
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState((){
        changeButton=false;
      });
    }
    else if(passwordController==null){
      return "Please Enter the password";
    }
    else if(usernameController==null){
      Fluttertoast.showToast(
          msg: "Enter Username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.red,
          backgroundColor: Colors.grey[200],
          fontSize: 16.0
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: 'Username',
                        filled: true
                      ),

                      onChanged: (value){
                        name=value;
                        setState((){});
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: 'Password',
                        filled: true

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
                    Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(changeButton?50:8),
                      child: InkWell(
                        onTap: ()async{
                          moveToHome(context);
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

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
