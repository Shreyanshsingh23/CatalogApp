class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}

class CatalogModel{

 static final products = [
  Item(id: 01 , name: "Skipping Rope",
  description: "5mtr long Skipping Rope", 
  price: 199, 
  color: "#33505a", 
  image: "https://gymmanufacturer.in/wp-content/uploads/2019/07/Skipping-Rope.jpg")

];
}
