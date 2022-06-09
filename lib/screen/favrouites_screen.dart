import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavrouitesScreen extends StatelessWidget {
  List<Meal> favrouiteMeals;
  FavrouitesScreen(this.favrouiteMeals, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return favrouiteMeals.isEmpty
        ? const Center(
            child: Text('No Favourite Food Available'),
          )
        : ListView(
            children: favrouiteMeals.map((data) {
              return MealItem(
                  id: data.id,
                  title: data.title,
                  image: data.imageUrl,
                  affordability: data.affordability,
                  complexity: data.complexity,
                  duration: data.duration);
            }).toList(),
          );
  }
}
