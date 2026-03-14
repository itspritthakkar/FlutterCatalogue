import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/cart_model.dart';

class CatalogHeader extends StatefulWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  State<CatalogHeader> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Catalog App",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              VxBuilder<MyStore>(
                mutations: const {AddMutation,RemoveMutation},
                builder: (context, store, _) => InkWell(
                    onTap: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Cart()));
                    },
                    child: const Icon(CupertinoIcons.cart, size: 30,)).px8().badge(color: Theme.of(context).colorScheme.primary, type: VxBadgeType.ellipse, count: _cart.items.length, textStyle: TextStyle(color: Theme.of(context).canvasColor, fontSize: 12, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const Text("Trending products", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
