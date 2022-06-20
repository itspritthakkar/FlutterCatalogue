import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/cart.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Catalog App",
                  style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cart()
                      )
                  );
                },
                  child: const Icon(CupertinoIcons.cart)
              )
            ],
          ),
          const Text("Trending products", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}