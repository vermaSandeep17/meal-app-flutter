import 'package:flutter/material.dart';
import 'package:new_flutter_meal/model/meals.dart';
import 'package:new_flutter_meal/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.removeItem,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';

      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExtraDetailMeal(
                    icon: Icons.schedule,
                    descriptiontxt: '$duration min',
                  ),
                  ExtraDetailMeal(
                    icon: Icons.work,
                    descriptiontxt: complexityText,
                  ),
                  ExtraDetailMeal(
                    icon: Icons.attach_money,
                    descriptiontxt: affordabilityText,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExtraDetailMeal extends StatelessWidget {
  const ExtraDetailMeal({
    Key? key,
    required this.icon,
    required this.descriptiontxt,
  }) : super(key: key);

  final IconData icon;
  final String descriptiontxt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 6,
          ),
          Text(descriptiontxt),
        ],
      ),
    );
  }
}
