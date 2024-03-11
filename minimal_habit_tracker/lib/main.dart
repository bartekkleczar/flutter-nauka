import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'models/habit_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HabitDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Center(
            child: Switch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            ),
          ),
        ),
      ),
    );
  }
}
