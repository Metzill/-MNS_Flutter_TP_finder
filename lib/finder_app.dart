import 'package:finder/bachelor_detail.dart';
import 'package:finder/bachelor_favorites.dart';
import 'package:flutter/material.dart';
import 'package:finder/bachelor_list.dart';
import 'package:go_router/go_router.dart';

class BachelorListApp extends StatelessWidget {
  BachelorListApp({super.key});

  // GoRouter configuration
  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => BachelorList(), routes: [
        GoRoute(
          path: 'favorites',
          builder: (context, state) => const BachelorFavorites(),
        ),
      ]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "BachelorList",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.grey),
          )),
      routerConfig: _router,
    );
  }
}
