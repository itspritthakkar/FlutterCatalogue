import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_widgets/list_layout.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          const CustomScrollView(
            shrinkWrap: true,
            slivers: [
              ListLayout(type: "wishlist")
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
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$9999".text.bold.xl4.make(),
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

