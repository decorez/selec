import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../screens/detail_screen.dart';
import '../theme/app_theme.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;

  const ExerciseTile({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.fitness_center)),
        title: Text(exercise.name),
        subtitle: Text('${exercise.muscleGroup} • ${exercise.equipment}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailScreen(exercise: exercise),
            ),
          );
        },
      ),
    );
  }
}