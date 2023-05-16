import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text('Yash Bhalgamiya'),
                  accountEmail: Text('bhalgamiyayash@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                ),
              ),
            ListTile(
              onTap: ()=>{
              Navigator.pushNamed(context, MyRoutes.homeRoute)
              },
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text('Home',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text('Profile',
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text('Email Me',
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}
