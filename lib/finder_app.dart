import 'package:flutter/material.dart';
import 'package:finder/bachelor_list.dart';

class BachelorListApp extends StatelessWidget {
  const BachelorListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BachelorList",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BachelorList(),
    );
  }
}
