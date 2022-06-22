import 'package:flutter/material.dart';
import 'package:myapp/models/CatalogModel.dart';
import '../../screens/home_details.dart';
import 'grid_widgets.dart';

class GridLayout extends StatefulWidget {
  const GridLayout({Key? key, this.valChanged}) : super(key: key);

  final bool? valChanged;

  @override
  State<GridLayout> createState() => _GridLayoutState();
}

class _GridLayoutState extends State<GridLayout> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        mainAxisExtent: 260.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) =>
            InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeDetails(
                            catalog: CatalogModel.items![index],
                          ),
                    ),
                  );
                  setState(() {});
                },
              child: GridWidget(
                  item: CatalogModel.items![index]
              ),
            ),
        childCount: CatalogModel.items?.length,
      ),
    );
  }
}