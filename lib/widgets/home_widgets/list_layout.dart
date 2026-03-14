import 'package:flutter/material.dart';
import 'package:myapp/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../screens/home_details.dart';
import 'item_widgets.dart';

class ListLayout extends StatelessWidget {
  final List<dynamic>? items;
  final String? type;

  const ListLayout({Key? key, this.type, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddLike, RemoveLike]);
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetails(
                catalog: type == "wishlist"
                    ? items![index]
                    : CatalogModel.items![index],
              ),
            ),
          );
        },
        child: ItemWidget(
          catalog:
              type == "wishlist" ? items![index] : CatalogModel.items![index],
          type: type,
        ),
      ),
      childCount: items?.length ?? CatalogModel.items?.length,
    ));
  }
}
