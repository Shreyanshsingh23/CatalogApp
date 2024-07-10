class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      //default constructor
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        description: map["description"],
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
        "description": description,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogModel {
  static List<Item> products = [];
}
