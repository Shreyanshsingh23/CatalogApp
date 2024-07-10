import 'package:fitness_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  final Item item;

  const ItemWidgets({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          onTap: () => print ("${item.name} Pressed"),
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
