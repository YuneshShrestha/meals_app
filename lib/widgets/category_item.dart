import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryMealsScreen.route,
            arguments: {'id': id, 'title': title});
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(title, style: Theme.of(context).textTheme.headline6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20.0),
          )),
    );
  }
}
