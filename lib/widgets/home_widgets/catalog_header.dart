import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Catalog App", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppTheme.darkBluishColor)),
          const Text("Trending products", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}