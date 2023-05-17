import 'package:flutter/material.dart';

import '../models/calatlog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}): assert(item!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: ()=>{
          print("${item.name} pressed")
        },
        leading: Image.network(item.imgURL),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,

          ),
        ),
      ),
    );
  }
}
