import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/like_widget.dart';

import '../../models/catalog.dart';


class GridWidget extends StatelessWidget {
  final Item item;

  const GridWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
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
                      color: Theme.of(context).canvasColor),
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
                      child: LikeWidget(item: item),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () async {

                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(CupertinoIcons.cart_badge_plus),
                    )
                ),
                Material(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () => {
                        debugPrint(item.name)
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
            ),
          )
        ],
      ),
    );
  }
}
