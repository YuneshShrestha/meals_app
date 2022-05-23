import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal_detail_screen';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    print(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
