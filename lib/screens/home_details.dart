import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    catalog.isLiked=!isLiked;
    return !isLiked;
  }

  const HomeDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          LikeButton(
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
          ).pOnly(right: 16)
        ],
      ),
      backgroundColor: AppTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.make(),
            Material(
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => {
                    debugPrint(catalog.name)
                  },
                  child: const SizedBox(
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
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: catalog.image != null ? Image.network(catalog.image.toString()) : Image.asset("assets/images/default.png"),
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(AppTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        "${"A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, a thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath".substring(0,200)}...".text.textStyle(context.captionStyle).make().pOnly(top: 16, right: 16, left: 16)
                      ],
                    ).py64(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
