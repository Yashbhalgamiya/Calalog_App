class CatalogModel{
  static List<Item> items=[
    Item(
        id: 1,
        name: "IQOO Z3",
        desc: "Vivo IQOO ",
        price: 200,
        color: "#35505a",
        image: "https://images.fonearena.com/blog/wp-content/uploads/2021/03/iQOO-Z3.jpg"
    )
  ];
}

class Item{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["imgURL"]

    );
  }

  toMap()=>{
    "id":id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image
  };


}

