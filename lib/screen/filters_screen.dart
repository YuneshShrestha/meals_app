import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String route = '/filters';
  final Map<String, bool> _filters;
  final Function? _setFilters;
  const FiltersScreen(this._filters, this._setFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    super.initState();
    _glutenFree = widget._filters["glutenFree"] as bool;
    _vegetarian = widget._filters["vegetarian"] as bool;
    _vegan = widget._filters["vegan"] as bool;
    _lactoseFree = widget._filters["lactoseFree"] as bool;
  }

  Widget _switchTile(String title, String subtitle, bool currentValue,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final _filters = {
                  "glutenFree": _glutenFree,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan,
                  "lactoseFree": _lactoseFree
                };
                widget._setFilters!(_filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Adjust your meal selection',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchTile(
                  'Gluten Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _switchTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _switchTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
                _switchTile(
                  'Lactose Free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
