import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exercise.dart';
import '../providers/favorite_provider.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatelessWidget {
  final Exercise exercise;

  const DetailScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>();
    final isFav = favorites.isFavorite(exercise.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            tooltip: isFav ? 'Remove from favorites' : 'Add to favorites',
            onPressed: () =>
                context.read<FavoriteProvider>().toggle(exercise.id),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.cardHighlight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Icon(Icons.fitness_center, size: 64)),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(exercise.muscleGroup)),
              Chip(label: Text(exercise.equipment)),
            ],
          ),
          const SizedBox(height: 16),
          Text('Instructions', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(exercise.instructions),
          const SizedBox(height: 24),
          Text('History & PR', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text('No workout history for this exercise yet.'),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              // TODO: 1. tambah ke current workout
            },
            icon: const Icon(Icons.add),
            label: const Text('Add to workout'),
          ),
        ],
      ),
    );
  }
}