import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? image;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  const MealItem(
      {this.id,
      this.title,
      this.image,
      this.duration,
      this.complexity,
      this.affordability,
      Key? key})
      : super(key: key);
  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'N/A';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealDetailScreen.route, arguments: id);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: Image.network(image!, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black54,
                        width: 300,
                        child: Text(
                          title!,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    itemBuild(Icons.schedule, '$duration min'),
                    itemBuild(Icons.work, getComplexity),
                    itemBuild(Icons.attach_money, getAffordability),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

Widget itemBuild(IconData icon, String data) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(
          width: 10.0,
        ),
        Text(data),
      ],
    ),
  );
}
