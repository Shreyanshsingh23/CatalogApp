import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int num = 23;
    int s = sum();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Fitness App $s",textAlign: TextAlign.left,)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Container(
          child: Text("My Fitness App $num"),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        surfaceTintColor: Colors.deepPurple,
       width: BorderSide.strokeAlignCenter,
       
      ),
    );
  }

  int sum({int a = 20, int b = 3}) {
    //{} are used for optional parameters, i.e. if we will not pass any specific value to the function call then these default values will be considered as parameters, so the sum will be 23
    return a + b;
  }
}
