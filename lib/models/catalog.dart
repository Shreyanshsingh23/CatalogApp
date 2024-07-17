
class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      //default constructor
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);

    // naming fromMap ya fromJson hi use karna hai kyuki kuch libraries yahi samajhti hain convert karte time

    //factory helps to choose which constructor to call on the basis of some logic

    //String datatype for key because all of our keys are String and values are dynamic i.e. some are String and some are numbers

    //yeh mapping bht dhyaan se karni padti hai mtlb according to backend, abhi toh sab humne hi banaya hai isliye same name hai but backend wale apna template khud banake rakhte hain toh unke hisaab se mapping karni padti hai
  }

  toMap() => {
        "id": id,
        "name": name,
        "description": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogModel {

   static final catalogModel = CatalogModel.internal();

  CatalogModel.internal();

  factory CatalogModel() => catalogModel;
  static List<Item> products = [];

  //get item by ID
   Item getByID(int id) =>
      products.firstWhere((element) => element.id == id, orElse:  null);

  // get item by position
   Item getByPosition(int position) => products[position];  //indirectly position means index of list which starts from 0
}
