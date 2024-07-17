// ignore_for_file: prefer_const_constructors

import 'package:fitness_app/models/cart.dart';
import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/home_details_page.dart';
import 'package:fitness_app/pages/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.products[index];
          return InkWell(
            child: Hero(
                transitionOnUserGestures: true,
                tag: Key(catalog.color.toString()),
                child: CatalogItem(catalog: catalog)),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catalog))),
          );
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
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.theme.primaryColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsetsDirectional.zero,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                _AddToCart(catalog: catalog)
              ],
            )
          ],
        ))
      ],
    ))
        .color(context.theme.dialogBackgroundColor)
        .square(150)
        .rounded
        .make()
        .py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {});
      },
      style: ButtonStyle(shape: WidgetStatePropertyAll(StadiumBorder())),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
