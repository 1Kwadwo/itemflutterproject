import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PersonalExpensesTrackerApp());
}

class PersonalExpensesTrackerApp extends StatelessWidget {
  const PersonalExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
