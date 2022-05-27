import 'package:flutter/material.dart';
import 'package:meals_app/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  ListTile buildListTile(IconData icon, String text, Function tapped) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: () => tapped(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w900),
            ),
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.route);
          }),
        ],
      ),
    );
  }
}
