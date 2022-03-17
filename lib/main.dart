import 'package:flutter/material.dart';
import 'package:new_flutter_meal/dummy_data.dart';
import 'package:new_flutter_meal/screens/categories_screen.dart';
import 'package:new_flutter_meal/screens/category_meal_screen.dart';
import 'package:new_flutter_meal/screens/filter_screen.dart';
import 'package:new_flutter_meal/screens/meal_detail_screen.dart';
import 'package:new_flutter_meal/screens/tabs_screen.dart';

import 'model/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'isVegan': false,
    'isVegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      // _availableMeals = DUMMY_MEALS.where((element) {
      //   if (_filters['gluten'] && !element.isGlutenFree) {
      //     return false;
      //   }
      //   if (_filters['lactose'] && !element.isLactoseFree) {
      //     return false;
      //   }
      //   if (_filters['isVegan'] && !element.isVegan) {
      //     return false;
      //   }
      //   if (_filters['isVegetarian'] && !element.isVegetarian) {
      //     return false;
      //   }
      //   return true;
      // }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsBarScreen(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
        );
      },
    );
  }
}
