import 'package:flutter/material.dart';
import 'package:new_flutter_meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.saveFilters);
  static const routeName = '/filters';
  final Function saveFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'isVegan': _isVegan,
                  'isVegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(
                Icons.save,
              ),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal Selection',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'This selection includes Gluten free meal',
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  _glutenFree,
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'This selection includes Lactose free meal',
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  _lactoseFree,
                ),
                _buildSwitchListTile(
                  'Vegan Free',
                  'This selection includes Vegan free meal',
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                  _isVegan,
                ),
                _buildSwitchListTile(
                  'Vegetarian-Free',
                  'This selection includes Vegetarian free meal',
                  (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                  _isVegetarian,
                ),
              ],
            ))
          ],
        ));
  }

  SwitchListTile _buildSwitchListTile(
    String title,
    String subtitle,
    dynamic updateValue,
    bool currentValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }
}
