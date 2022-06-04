import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/filters_screen.dart';
import './screen/bottom_navbar.dart';
import './screen/category_meals_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/categories_screen.dart';
import './dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool>? _filters = {
    "glutenFree": false,
    "vegetarian": false,
    "vegan": false,
    "lactoseFree": false
  };
  List<Meal> availableMeals = dummyMeals;
  void _setFilters(Map<String, bool>? newFilters) {
    setState(() {
      _filters = newFilters;
      availableMeals = dummyMeals.where((meal) {
        if (_filters!['glutenFree'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters!['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (_filters!['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters!['lactoseFree'] as bool && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: const CategoriesScreen(),
        // darkTheme: ThemeData.dark(),
        // themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.amber, primary: Colors.purple),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
        ),
        routes: {
          // "/": (BuildContext context) => const CategoriesScreen(),
          "/": (BuildContext context) => const BottomNavbar(),
          CategoryMealsScreen.route: (BuildContext context) =>
              CategoryMealsScreen(availableMeals),
          MealDetailScreen.route: (BuildContext context) =>
              const MealDetailScreen(),
          FiltersScreen.route: (BuildContext context) =>
              FiltersScreen(_filters!, _setFilters)
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        });
  }
}
