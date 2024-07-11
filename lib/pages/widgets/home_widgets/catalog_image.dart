import 'package:fitness_app/pages/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
 final String image ;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    return Image.network(image).box.rounded.color(MyTheme.creamColor).make().px12().py8().w40(context);
  }
}