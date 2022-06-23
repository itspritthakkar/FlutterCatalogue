import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/CartModel.dart';
import '../../models/CatalogModel.dart';


class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool? isInCart = _cart.items.contains(catalog);
    return InkWell(
        onTap: () async {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: isInCart ? const Icon(CupertinoIcons.check_mark_circled_solid) : const Icon(CupertinoIcons.cart_badge_plus),
        )
    );
  }
}
