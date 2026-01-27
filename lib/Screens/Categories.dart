import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  /*
  StateLessWidget is for showning fixed UI
  It does not store data that changes.
  */
  const CategoriesScreen({super.key,required this.onToggleFavorite});
  // this is the constructor for the CategoriesScreen
  //super.key passes key to parent class

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    // here we are not updating the screen instead we are showing a different screen when tap on categories.
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // this will return only the meals that belong to the selected category.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, 
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
          ),
      ),
    ); // it works on the stack so it is called push every time you push you will see the top most screen in the stack.
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of columns
          childAspectRatio: 3 / 2, //(width / height)
          crossAxisSpacing: 20, // space from left and right
          mainAxisSpacing: 20, // space from top and bottom
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context,category);
              }, // here the CateGoryItem takes the _selectCategory function as argument which shows the MealsScreen().
            ),
        ],
      );
  }
}
