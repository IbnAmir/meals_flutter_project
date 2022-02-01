import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_flutter_project/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    updateValue,
  ) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
                },
              ),
              _buildSwitchListTile('Vegetarian',
                'Only include Vegetarian meals.',
                _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile('Vegan',
                'Only include Vegans meals.',
                _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile('Lactose-Free',
                'Only include Lactose-Free meals.',
                _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ),)
        ],
      ),
    );
  }
}