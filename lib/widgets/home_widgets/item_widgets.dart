import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/CatalogModel.dart';
import '../delete_widget.dart';
import '../like_widget.dart';

class ItemWidget extends StatelessWidget {
  final Item catalog;

  final String? type;

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    catalog.isLiked=!isLiked;
    return !isLiked;
  }

  const ItemWidget({Key? key, required this.catalog, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: catalog.image != null ? Image.network(catalog.image.toString()).box.rounded.p8.color(context.canvasColor).make().p16().w40(context) : Image.asset("assets/images/default.png").box.rounded.p8.color(context.canvasColor).make().p16().w40(context)
          ),
          Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      catalog.name.text.lg.bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          "\$${catalog.price}".text.bold.xl.make(),
                          Row(
                            children: type=="wishlist" ? [] : [
                              AddToCart(catalog: catalog),
                              Material(
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () => {
                                      debugPrint(catalog.name)
                                    },
                                    child: const SizedBox(
                                      width: 70,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          "Buy",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ).pOnly(right: 8.0)
                    ],
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: type != "wishlist" ? LikeWidget(item: catalog): DeleteWidget(item: catalog),
                  )
                ],
              ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}
