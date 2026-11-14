import 'package:flutter/material.dart';

import '../data/dummy_exercise.dart';
import '../models/exercise.dart';
import '../widgets/exercise_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';
  String? _group;

  List<Exercise> get _results => dummyExercises.where((e) {
        final matchName = e.name.toLowerCase().contains(_query.toLowerCase());
        final matchGroup = _group == null || e.muscleGroup == _group;
        return matchName && matchGroup;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final results = _results;
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search exercises...',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                for (final g in muscleGroups)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(g),
                      selected: _group == g,
                      onSelected: (selected) =>
                          setState(() => _group = selected ? g : null),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Center(child: Text('No exercises found'))
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (_, i) => ExerciseTile(exercise: results[i]),
                  ),
          ),
        ],
      ),
    );
  }
}