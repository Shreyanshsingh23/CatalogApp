// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:ui';

import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/widgets/drawer.dart';
import 'package:fitness_app/pages/widgets/themes.dart';
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
    await Future.delayed(const Duration(seconds: 3));
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

      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.products.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }

  int sum({int a = 20, int b = 3}) {
    //{} are used for optional parameters, i.e. if we will not pass any specific value to the function call then these default values will be considered as parameters, so the sum will be 23
    return a + b;
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.products[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
          
             catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
             catalog.desc.text.textStyle(context.captionStyle).make(),
             10.heightBox,
             ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(StadiumBorder())
                ),)
              ],
             )
           ],
          ))
        ],
        
      )
    ).white.square(150).rounded.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
 final String image ;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    return Image.network(image).box.rounded.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
