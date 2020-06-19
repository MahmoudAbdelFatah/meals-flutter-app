import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const screenName = '/meal_detail';

  final Function _favoriteMealsHandler;
  final Function _isFavoriteMealHandler;

  MealDetailScreen(this._favoriteMealsHandler, this._isFavoriteMealHandler);

  Widget buildSectionTitle(BuildContext context, text) {
    return Container(
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget drawSectionList(BuildContext context, selectedList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Text(
              selectedList[index],
            ),
          );
        },
        itemCount: selectedList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 6,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            drawSectionList(context, selectedMeal.ingredients),
            buildSectionTitle(context, 'Steps'),
            drawSectionList(context, selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => _favoriteMealsHandler(mealId),
        child: Icon(
          _isFavoriteMealHandler(mealId)
              ? Icons.favorite
              : Icons.favorite_border,
        ),
      ),
    );
  }
}
