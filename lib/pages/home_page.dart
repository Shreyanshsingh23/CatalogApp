import 'package:fitness_app/main.dart';
import 'package:fitness_app/pages/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/pages/widgets/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   

  @override
  Widget build(BuildContext context) {
    const int num = 23;
    int s = sum();
    bool temporary = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fitness App $s",
        ),
        actions: [
          IconButton(
              icon: Icon((MyTheme.isDarkTheme) ?
                   CupertinoIcons.sun_max
                  :CupertinoIcons.moon),
              onPressed: () {
                temporary = true;
              }),
        ],

        centerTitle: true,

        //backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Container(
          child: const Text("My Fitness App $num"),
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: Container(
        child: Icon(CupertinoIcons.option),
      ),
    );
  }

  int sum({int a = 20, int b = 3}) {
    //{} are used for optional parameters, i.e. if we will not pass any specific value to the function call then these default values will be considered as parameters, so the sum will be 23
    return a + b;
  }
}
