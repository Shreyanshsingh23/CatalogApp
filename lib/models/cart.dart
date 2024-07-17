// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel.internal();

  CartModel.internal();

  factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalog;

  //getter for _catalog i.e. we can't directly access private _catalog but can access this catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //collection of IDs
  final List<int> _itemIds = [];

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
