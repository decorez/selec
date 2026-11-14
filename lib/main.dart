import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/favorite_provider.dart';
import 'screens/main_shell.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO: 1. Load workout favorit dari local storage
  final favorites = FavoriteProvider();
  await favorites.load();

  runApp(
    ChangeNotifierProvider.value(
      value: favorites,
      child: const SelecApp(),
    ),
  );
}

class SelecApp extends StatelessWidget {
  const SelecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selec',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const MainShell(),
    );
  }
}