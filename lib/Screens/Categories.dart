import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  /*
  StateLessWidget is for showning fixed UI
  It does not store data that changes.
  */ 
  const CategoriesScreen({super.key}); 
  // this is the constructor for the CategoriesScreen
  //super.key passes key to parent class


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your Category'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of columns
          childAspectRatio: 3/2,//(width / height)
          crossAxisSpacing: 20, // space from left and right
          mainAxisSpacing: 20, // space from top and bottom
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
