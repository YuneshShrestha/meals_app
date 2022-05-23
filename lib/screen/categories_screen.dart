import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Categories Screen')),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            // padding: const EdgeInsets.all(10.0),
            children: dummyData.map((category) {
              return CategoryItem(
                  category.id!, category.title!, category.color!);
            }).toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0),
          ),
        ));
  }
}
