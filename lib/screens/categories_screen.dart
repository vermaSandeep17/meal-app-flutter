import 'package:flutter/material.dart';
import 'package:new_flutter_meal/widgets/category_item.dart';
import 'package:new_flutter_meal/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((element) {
        return CategoryItem(
          element.id,
          element.title,
          element.color,
        );
      }).toList(),
    );
  }
}
