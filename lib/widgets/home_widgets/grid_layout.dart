import 'package:flutter/material.dart';
import 'package:myapp/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../screens/home_details.dart';
import 'grid_widgets.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddLike, RemoveLike]);
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        mainAxisExtent: 260.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetails(
                  catalog: CatalogModel.items![index],
                ),
              ),
            );
          },
          child: GridWidget(item: CatalogModel.items![index]),
        ),
        childCount: CatalogModel.items?.length,
      ),
    );
  }
}
