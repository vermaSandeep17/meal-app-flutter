import 'package:flutter/material.dart';
import 'package:new_flutter_meal/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              20,
            ),
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xfffffff9c4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DrawerItemTile(
            selectHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icons.restaurant,
            title: 'Meals',
          ),
          DrawerItemTile(
            selectHandler: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
            icon: Icons.settings,
            title: 'Filters',
          )
        ],
      ),
    );
  }
}

class DrawerItemTile extends StatelessWidget {
  DrawerItemTile({
    required this.title,
    required this.icon,
    required this.selectHandler,
  });
  final String title;
  final IconData icon;
  final VoidCallback selectHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: selectHandler,
    );
  }
}
