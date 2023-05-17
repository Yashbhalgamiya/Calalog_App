class Catalog{
  static final items=[
    Item(
        id: 1,
        name: "IQOO Z3",
        desc: "Vivo IQOO ",
        price: 200,
        color: "#35505a",
        imgURL: "https://images.fonearena.com/blog/wp-content/uploads/2021/03/iQOO-Z3.jpg"
    )
  ];
}

class Item{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgURL;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imgURL});




}

