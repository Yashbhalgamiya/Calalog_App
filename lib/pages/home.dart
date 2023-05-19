import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/calatlog.dart';
import 'package:flutter_catalog/widgest/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgest/drawer.dart';
import '../widgest/item_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 5));
    final catalogJson=await rootBundle.loadString("assets/files/catalog.json");
    final decodeData=jsonDecode(catalogJson);
    //print(decodeData);
    var productsData=decodeData["products"];
   // print(productsData);
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState((){});
  }

  @override
  Widget build(BuildContext context) {

    //final dummyList=List.generate(20, (index) => Catalog.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "CatalogApp".text.xl5.bold.color(MyTheme.darkBlue).make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context,index){
        final catalog=CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {

  final Item catalog;
  const CatalogItem({Key? key,required this.catalog}) :assert(catalog!=null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
              image: catalog.image
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(MyTheme.darkBlue).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: ()=>{},
                      child: "Buy".text.make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                      shape: MaterialStateProperty.all(StadiumBorder(),)
                    ),
                  )
                ],
              ).pOnly(right: 8)
            ],
          ))
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}):assert(image!=null),super(key: key);


  @override
  Widget build(BuildContext context) {
    return Image.network(
        image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
