import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = "/category_meals";
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Not Here');

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? title = args['title'];
    final String? id = args['id'];
    final mealsDetail = dummyMeals.where((data) {
      return data.categories.contains(id);
    });
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView(
        children: mealsDetail.map((data) {
          return MealItem(
              id: data.id,
              title: data.title,
              image: data.imageUrl,
              affordability: data.affordability,
              complexity: data.complexity,
              duration: data.duration);
        }).toList(),
      ),
    );
  }
}
