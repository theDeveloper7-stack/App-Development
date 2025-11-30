enum Complexity {
  simple,
  challenging,
  hard,
}

// enum is a group of fixed values
/*
  creates a type called Complexity
  it can have 3 values that is

  Complexity.simple
  Complexity.challenging
  Complexity.hard
*/

// this tells the difficulty of the meal

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

// this tells the affordability or how expensive of the meal

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  // Meal class has a constructor function that takes different arguments which are declared below
  // These will help to create dummy data for meals

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}