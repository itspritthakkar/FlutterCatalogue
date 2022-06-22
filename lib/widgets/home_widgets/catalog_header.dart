import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/cart.dart';

class CatalogHeader extends StatefulWidget {
  const CatalogHeader({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<bool> onChanged;

  @override
  State<CatalogHeader> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {

  void _handleTap() {
    widget.onChanged(true);
  }

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
                  _handleTap();
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