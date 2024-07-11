import 'package:fitness_app/models/catalog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  //final Item catalog;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      body: ListView.builder(
        itemBuilder: (context, index) {
       Item  catalog=  CatalogModel.products[index];
        },
        itemCount: CatalogModel.products.length,
      ),
    );
  }
}
