import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favrouites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class BottomNavbar extends StatefulWidget {
  List<Meal>? favrouiteMeals;
  BottomNavbar(this.favrouiteMeals, {Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  void getIndex(i) {
    setState(() {
      currentIndex = i;
    });
  }

  List<Map<String, Object>>? pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages= [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page':  FavrouitesScreen(widget.favrouiteMeals!), 'title': 'Your Favrouites'}
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages?[currentIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(child: pages?[currentIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: getIndex,
        currentIndex: currentIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
