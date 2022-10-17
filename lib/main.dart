import 'package:flutter/material.dart';
import 'package:golf_score/score_input.dart';
import 'package:provider/provider.dart';

import 'each_hole_score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return EachHoleScore();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScoreInput(),
      ),
    );
  }
}
