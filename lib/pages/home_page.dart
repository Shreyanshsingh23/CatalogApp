// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/widgets/drawer.dart';
import 'package:fitness_app/pages/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
    const int num = 23;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = (brightness == Brightness.dark);

    bool temporary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fitness App $num",
        ),
        actions: [
          IconButton(
              icon: Icon(
                  //(MyApp.is_DarkTheme)
                  isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon),
              onPressed: () {
                temporary = true;
              }),
        ],

        centerTitle: true,

        //backgroundColor: Colors.pinkAccent,
      ),
      body: (CatalogModel.products.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              item: CatalogModel.products[index],
            );
          }) :Center (child:  CircularProgressIndicator()),
      drawer: MyDrawer(),
    );
  }

  int sum({int a = 20, int b = 3}) {
    //{} are used for optional parameters, i.e. if we will not pass any specific value to the function call then these default values will be considered as parameters, so the sum will be 23
    return a + b;
  }
}
