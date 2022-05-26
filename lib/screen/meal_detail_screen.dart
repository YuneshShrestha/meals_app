import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal_detail_screen';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetail = dummyMeals.firstWhere((data) => data.id == id);
    return Scaffold(
        appBar: AppBar(
          title: Text(mealDetail.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).primaryColorLight)),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView(
                    children: mealDetail.ingredients
                        .map(
                          (ingredient) => Text(ingredient),
                        )
                        .toList(),
                  )),
              Center(
                child: Text(
                  'Receipe',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).primaryColorLight)),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView(
                    children: mealDetail.steps
                        .map(
                          (step) => Text(step),
                        )
                        .toList(),
                  ))
            ],
          ),
        ));
  }
}
