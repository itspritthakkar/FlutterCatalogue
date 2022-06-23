import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_widgets/list_layout.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/CartModel.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
        scrolledUnderElevation: 0.0,
      ),
      body: _cart.items.isEmpty ? "Nothing to show".text.xl.makeCentered() : Column(
        children: [
          CustomScrollView(
            shrinkWrap: true,
            slivers: [
              ListLayout(items: _cart.items, type: "wishlist")
            ],
          ).expand(),
          const _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder<MyStore>(
              mutations: const {RemoveMutation},
              builder: (context, store, status) => "\$${_cart.totalPrice}".text.bold.xl4.make(),
          ),
          Material(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("We do not support checkout yet")))
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
      ),
    ).px16();
  }
}

