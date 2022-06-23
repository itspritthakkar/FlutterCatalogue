import 'package:flutter/material.dart';
import 'package:myapp/models/CatalogModel.dart';
import '../../screens/home_details.dart';
import 'item_widgets.dart';

class ListLayout extends StatefulWidget {
  final List<dynamic>? items;
  final String? type;

  final bool? valChanged;

  const ListLayout({Key? key, this.type, this.valChanged, this.items}) : super(key: key);

  @override
  State<ListLayout> createState() => _ListLayoutState();
}

class _ListLayoutState extends State<ListLayout> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) =>
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeDetails(
                            catalog: widget.type == "wishlist" ? widget.items![index] : CatalogModel.items![index],
                          ),
                    ),
                  );
                  setState(() {});
                },
                child: ItemWidget(
                    catalog: widget.type == "wishlist" ? widget.items![index] : CatalogModel.items![index],
                  type: widget.type,
                ),
              ),
          childCount: widget.items?.length ?? CatalogModel.items?.length,
        )
    );
  }
}