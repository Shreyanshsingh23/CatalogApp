// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        drawerDragStartBehavior: DragStartBehavior.start,
        body: Column(
          children: [
            _CartList().p32().expand(),
            Divider(),
            _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
     final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet.".text.make(),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(CupertinoIcons.right_chevron),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {},
              ),
            ));
  }
}

addToCart(int id) {
  final index = id;
}
