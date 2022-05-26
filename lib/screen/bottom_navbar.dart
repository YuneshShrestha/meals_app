import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favrouites.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

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

  final List<Map<String, Object>> pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const Favrouites(), 'title': 'Your Favrouites'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentIndex]['title'] as String),
      ),
      body: pages[currentIndex]['page'] as Widget,
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
