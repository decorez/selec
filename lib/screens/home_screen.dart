import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_exercise.dart';
import '../providers/favorite_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/exercise_tile.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteIds = context.watch<FavoriteProvider>().ids;
    final favorites =
        dummyExercises.where((e) => favoriteIds.contains(e.id)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Selec')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(child: _StatCard(label: 'Streak', value: '0 days')),
                SizedBox(width: 12),
                Expanded(
                  child: _StatCard(label: 'Weekly volume', value: '0 kg'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: FilledButton.icon(
              onPressed: () {
                // TODO: 1. button start workout 
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Workout'),
            ),
          ),
          _SectionHeader(
            title: 'Favorites',
            actionLabel: 'See all',
            onAction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoriteScreen()),
              );
            },
          ),
          if (favorites.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'No favorites yet. Tap the heart on an exercise to save it.',
              ),
            )
          else
            for (final e in favorites.take(3)) ExerciseTile(exercise: e),
          const _SectionHeader(title: 'Popular exercises'),
          for (final e in dummyExercises.take(3)) ExerciseTile(exercise: e),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (actionLabel != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}