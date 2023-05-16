import 'package:flutter/material.dart';

import '../widgest/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog"),
      ),
      body: Center(
        child: Container(
          child: Text('Yash Bhalgamiya'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
