import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_trait.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toLowerCase() +
        meal.complexity.name.substring(1);
  }

    String get affordabilityText {
    return meal.affordability.name[0].toLowerCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      // It tells the card what to do with the child widget if it overflows.
      // here Clip.hardEdge cuts anything that goes outside the card's border
      elevation: 2,
      // it creates the shadow effect under the card and the number identfies how above the card is raised.
      child: InkWell(
        onTap: () {},
        child: Stack(
          // this will stack the widgets one on another like a layer so that all widgets can freely acquire spaces
          // starts from the bottom to top.
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              // loads an image from memomry bytes(not from assets or network)
              image: NetworkImage(meal.imageUrl),
              // fetches the image from the network or from online url.
              fit: BoxFit.cover,
              // it will fit the image accoding to the card size.
              height: 300,
              width: double.infinity,
            ),
            // It shows a placeholder image 1st then fades in the real image smoothly.
            Positioned(
              // this will decide how the child widget will be placed
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      // if some long text is there then it converts it to two lines, further that it will show only dots ......
                      textAlign: TextAlign.center, // to center the text
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, //
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        SizedBox(width: 12),
                        MealTrait(
                          icon: Icons.rice_bowl,
                          label: complexityText,
                        ),
                        SizedBox(width: 12),
                        MealTrait(
                          icon: Icons.monetization_on,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
