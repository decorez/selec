import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _useKg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'User Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(child: _InfoCard(label: 'Workout', value: '0')),
              SizedBox(width: 12),
              Expanded(child: _InfoCard(label: 'Total volume', value: '0 kg')),
            ],
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.monitor_weight_outlined),
            title: Text('Body weight'),
            trailing: Text('- kg'),
          ),
          const ListTile(
            leading: Icon(Icons.height),
            title: Text('Height'),
            trailing: Text('- cm'),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.scale_outlined),
            title: const Text('Weight unit'),
            subtitle: Text(_useKg ? 'Kilograms (kg)' : 'Pounds (lb)'),
            value: _useKg,
            onChanged: (v) => setState(() => _useKg = v),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}