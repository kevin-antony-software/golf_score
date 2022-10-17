import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'each_hole_score.dart';
import 'hole_details.dart';

class ScoreInput extends StatefulWidget {
  const ScoreInput({Key? key}) : super(key: key);

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Input Sheet"),
        backgroundColor: Colors.green,
      ),
      body: Consumer(
        builder: (context, EachHoleScore eachHoleList, child) {
          var total = eachHoleList.totalShotsPlayed;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * 0.6,
                  //height: 300,
                  child: Image.asset("images/golf_score2.jpg"),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Total Shots -  $total",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: eachHoleList.eachHoleScore.keys
                        .map((e) => HoleDetails(
                            width: width,
                            holeNum: e,
                            holeScore: eachHoleList.eachHoleScore[e]!))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
