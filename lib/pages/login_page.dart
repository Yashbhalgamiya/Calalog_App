import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("images/login.png",fit: BoxFit.cover),
          SizedBox(height: 20,),
          Text("Welcome",
          style: TextStyle(
            fontSize: 20,
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
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    print("Hi This is Catalog app");
                  },
                  child: Text("Login"),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}