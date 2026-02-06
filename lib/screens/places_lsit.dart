import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/screens/add_place.dart';
import 'package:favourite_places/widgets/places_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesLsitScreen extends ConsumerWidget {
  const PlacesLsitScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => AddPlaceScreen()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesListWidget(
        places:
          userPlaces,
      ),
    );
  }
}
