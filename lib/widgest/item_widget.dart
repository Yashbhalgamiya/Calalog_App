import 'package:flutter/material.dart';

import '../models/calatlog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;
  const ItemWidget({Key? key, required this.item}) : assert(item!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          onTap: ()=>{
            print("${item.name}")
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$${item.price.toString()}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
