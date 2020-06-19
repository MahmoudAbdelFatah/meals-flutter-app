import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

import './categories_screen.dart';
import './favorite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

//adding a bottom TabBar

class _TabsScreenState extends State<TabsScreen> {
  int _indexScreenTab = 0;
  List<Map<String, Object>> _page;

  @override
  void initState() {
    _page = [
      {
        'page': CategoriesScreen(),
        'title': Text('Categories'),
      },
      {
        'page': FavoriteScreen(widget._favoriteMeals),
        'title': Text('Favorities'),
      },
    ];
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _indexScreenTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _page[_indexScreenTab]['title'],
      ),
      drawer: MainDrawer(),
      body: _page[_indexScreenTab]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _indexScreenTab,
        //type: BottomNavigationBarType.fixed,
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

//adding the TabBar to the AppBar
/*
class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
              ),
              text: 'Favorite',
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
*/
