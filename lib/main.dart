import 'package:flutter/material.dart';
import 'package:meals_app/screen/filters_screen.dart';
import './screen/bottom_navbar.dart';
import './screen/category_meals_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              const CategoryMealsScreen(),
          MealDetailScreen.route: (BuildContext context) =>
              const MealDetailScreen(),
          FiltersScreen.route: (BuildContext context) => const FiltersScreen()
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        });
  }
}
