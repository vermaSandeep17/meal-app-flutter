import 'package:flutter/material.dart';
import 'package:new_flutter_meal/screens/categories_screen.dart';
import 'package:new_flutter_meal/screens/favorites_screen.dart';
import 'package:new_flutter_meal/widgets/main_drawer.dart';

class TabsBarScreen extends StatefulWidget {
  const TabsBarScreen({Key? key}) : super(key: key);

  @override
  _TabsBarScreenState createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    }
  ];
  int _selectedIndex = 0;
  void _selectedPageIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPageIndex,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
