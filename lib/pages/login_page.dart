import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/login.png",fit: BoxFit.cover),
            SizedBox(height: 20,),
            Text("Welcome",
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
                  ElevatedButton(
                    style: TextButton.styleFrom(minimumSize: Size(150,40)),
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Login"),
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
