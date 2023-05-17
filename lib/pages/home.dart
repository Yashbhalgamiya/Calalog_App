import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/calatlog.dart';

import '../widgest/drawer.dart';
import '../widgest/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dummyList=List.generate(20, (index) => Catalog.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(item: dummyList[index]);
          },

        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
