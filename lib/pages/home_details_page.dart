import 'package:fitness_app/models/catalog.dart';
import 'package:fitness_app/pages/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;   // object of Item Class

  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        
        child: Column( 
        children: [
         Hero(
          tag: Key(catalog.id.toString()),
         child: Image.network(catalog.image).h32(context)).p20(),
         Expanded(
          child: VxArc(
            height: 20,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: Colors.white,
              width:context.screenWidth ,
              
              child: Column(
                children: [
                  
             catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
             catalog.desc.text.xl.textStyle(context.captionStyle).make(),
             10.heightBox,

             "Erat sed erat ea ipsum voluptua amet sanctus diam. Vero ut amet elitr consetetur no diam. Magna duo diam dolore sed sit lorem diam et. Erat dolor erat justo eos no, at consetetur ipsum duo dolor, dolor takimata lorem labore eirmod. Amet et nonumy elitr labore elitr ipsum, sanctus consetetur.".text.textStyle(context.captionStyle).make().p16()
                ],
              ).pOnly(top: 64),
            ),
            
          ),
         ),
         Container(
          color: Colors.white,
           child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  "\$${catalog.price}".text.xl4.bold.red700.make(),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(StadiumBorder())
                  ), child: "Add to cart".text.bold.xl.make(),).wh(130, 50)
                ],
               ).p12(),
         )
        ],
        ),
      )
    );
  }
}
