import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_exercise.dart';
import '../providers/favorite_provider.dart';
import '../widgets/exercise_tile.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteIds = context.watch<FavoriteProvider>().ids;
    final favorites =
        dummyExercises.where((e) => favoriteIds.contains(e.id)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: favorites.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No favorites yet.\nFind an exercise in the Search tab and tap the heart icon.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, i) => ExerciseTile(exercise: favorites[i]),
            ),
    );
  }
}