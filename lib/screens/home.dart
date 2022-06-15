import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:myapp/widgets/home_widgets/catalog_header.dart';
import 'package:myapp/widgets/home_widgets/grid_layout.dart';
import 'package:myapp/widgets/home_widgets/list_layout.dart';

// ignore: camel_case_types
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String currentLayout="grid";
  bool isProcessing=false;

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  changeLayout(String type) async {
    if(currentLayout!=type){
      isProcessing = true;
      setState((){});
      await Future.delayed(const Duration(seconds: 1));
      if(type=="grid"){
        currentLayout="grid";
        setState(() {});
      }else{
        currentLayout="list";
        setState(() {});
      }
      isProcessing = false;
      setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty && isProcessing==false)
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Layouts",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Material(
                                        child: InkWell(
                                          onTap: () => {
                                            changeLayout("list")
                                          },
                                          child: const Icon(
                                              CupertinoIcons.rectangle_grid_1x2
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Material(
                                        child: InkWell(
                                          onTap: () => {
                                            changeLayout("grid")
                                          },
                                          child: const Icon(
                                              CupertinoIcons.rectangle_grid_2x2
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      currentLayout=="grid" ? const GridLayout(): const ListLayout()
                    ],
                  ),
                )
              else
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
