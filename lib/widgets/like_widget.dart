import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../models/CatalogModel.dart';

class LikeWidget extends StatelessWidget {
  final Item item;

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    item.isLiked=!isLiked;
    return !isLiked;
  }

  const LikeWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: LikeButton(
          isLiked: item.isLiked,
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
              color: isLiked ? Colors.red : Theme.of(context).colorScheme.primary,
              size: 25,
            );
          }
      ),
    );
  }
}
