import 'package:flutter/material.dart';
import 'package:new_flutter_meal/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  final String title;
  final Color color;
  final String id;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
