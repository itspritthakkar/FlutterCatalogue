import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/catalog_model.dart';

class DeleteWidget extends StatelessWidget {
  final Item item;

  const DeleteWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RemoveMutation(item),
      child: const SizedBox(
        width: 25,
        height: 25,
        child: Icon(
          CupertinoIcons.multiply,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
