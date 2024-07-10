// ignore_for_file: non_constant_identifier_names

import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/widgets/drawer.dart';
import 'package:fitness_app/pages/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int num = 23;
    
    var brightness = MediaQuery.of(context).platformBrightness;
bool isDarkMode = (brightness == Brightness.dark);
 
    bool temporary;

    final dummyList = List.generate(
      15,(index) => CatalogModel.products
      [0]
    );

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
      body: ListView.builder(
         itemCount: dummyList.length,
        itemBuilder: (context, index)
      {
        
        return ItemWidgets(
          
          item: dummyList[index] ,
        );
      }),
      drawer: MyDrawer(),
      
     
    );
  }

  int sum({int a = 20, int b = 3}) {
    //{} are used for optional parameters, i.e. if we will not pass any specific value to the function call then these default values will be considered as parameters, so the sum will be 23
    return a + b;
  }
}
