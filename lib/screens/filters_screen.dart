import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenName = 'filter_Screen';
  final Map<String, bool> _filters;
  final Function filterHandler;

  FiltersScreen(this._filters, this.filterHandler);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree;
  bool _isLactoseFree;
  bool _isVegan;
  bool _isVegetarian;

  @override
  initState() {
    _isGlutenFree = widget._filters['gluten'];
    _isLactoseFree = widget._filters['lactose'];
    _isVegan = widget._filters['vegan'];
    _isVegetarian = widget._filters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function filterHandler) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: filterHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.filterHandler(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust',
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(15),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free',
                  'Include only gluten free meals', _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Lactose-Free',
                  'Include only Lactose free meals',
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegan', 'Include only Vegan meals', _isVegan, (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Include only Vegetarian meals', _isVegetarian,
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
