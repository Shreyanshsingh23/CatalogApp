// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/cart_page.dart';
import 'package:fitness_app/pages/widgets/home_widgets/catalog_heaader.dart';
import 'package:fitness_app/pages/widgets/home_widgets/catalog_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"]; //in form of map

    // ab decode to kar liya par catalog.dart ki Item class according map bhi karana padega taaki data usme load ho paaye toh hum naya constructor bana sakte hain wahin pe
    // constructor bana diya hai

    //

    //List<Item> list = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // yeh kaam bht dhyaan se seekhna hai upar wala
  }

  @override
  Widget build(BuildContext context) {
  
   

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()))
        ,
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.products.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }

}
