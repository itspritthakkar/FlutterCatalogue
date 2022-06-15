import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:myapp/widgets/themes.dart';

import '../../models/catalog.dart';


class GridWidget extends StatelessWidget {
  final Item item;

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    item.isLiked=!isLiked;
    return !isLiked;
  }

  const GridWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 0.3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
                const SizedBox(height: 10,),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                      color: AppTheme.creamColor),
                      margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                      alignment: Alignment.center,
                        child: Hero(
                            tag: Key(item.id.toString()),
                            child: item.image != null ? Image.network(item.image.toString(), width: 105, height: 105) : Image.asset("assets/images/default.png", width: 105, height: 105)
                        )
                    ),
                    Positioned(
                      right: 15,
                      top: 5,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: LikeButton(
                          isLiked: item.isLiked,
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
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.horizontal,
                    children: [
                    Flexible(
                            child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold),)
                        ),
                        const SizedBox(width: 7,),
                        Text("\$${item.price.toString()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
                  alignment: Alignment.centerLeft,
                    child: Text("${item.desc.substring(0, 20)}...", style: TextStyle(color: Colors.grey.shade600, fontSize: 13),)
                ),
              ]
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Material(
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => {
                    debugPrint(item.name)
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 35,
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
