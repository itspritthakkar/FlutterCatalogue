import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CatalogModel.dart';

class DeleteWidget extends StatelessWidget {
  final Item item;

  const DeleteWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 25,
      height: 25,
      child: Icon(
        CupertinoIcons.multiply,
        color: Colors.grey,
        size: 20,
      ),
    );
  }
}
