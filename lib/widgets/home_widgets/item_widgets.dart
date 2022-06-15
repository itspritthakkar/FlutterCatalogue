import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item catalog;

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    catalog.isLiked=!isLiked;
    return !isLiked;
  }

  const ItemWidget({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: catalog.image != null ? Image.network(catalog.image.toString()).box.rounded.p8.color(AppTheme.creamColor).make().p16().w40(context) : Image.asset("assets/images/default.png").box.rounded.p8.color(AppTheme.creamColor).make().p16().w40(context)
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
                          Material(
                              color: Colors.black,
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
                          )
                        ],
                      ).pOnly(right: 8.0)
                    ],
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: LikeButton(
                          isLiked: catalog.isLiked,
                          mainAxisAlignment: MainAxisAlignment.end,
                          size: 20,
                          onTap: onLikeButtonTapped,
                          circleColor:
                          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                              color: isLiked ? Colors.red : Colors.black,
                              size: 25,
                            );
                          }
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    ).white.rounded.square(150).make().py12();
  }
}
