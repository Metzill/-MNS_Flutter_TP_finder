import 'package:finder/provider/bachelor_provider.dart';
import 'package:flutter/material.dart';
import 'package:finder/finder_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BachelorProvider()),
  ], child: BachelorListApp()));
}
