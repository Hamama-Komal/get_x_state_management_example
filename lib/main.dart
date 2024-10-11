import 'package:flutter/material.dart';
import 'package:get_x_example/favorite_example.dart';
import 'package:get_x_example/pages/home_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:get_x_example/simple_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.limeM3),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.limeM3),
      themeMode: ThemeMode.system,
      home: FavoriteExample(),
    );
  }
}

