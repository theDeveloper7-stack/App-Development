import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/places_details.dart';
import 'package:flutter/material.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text(
          'No places added yet',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlacesDetailsScreen(place: places[index]),
            ),
          );
        },
      ),
    );
  }
}
