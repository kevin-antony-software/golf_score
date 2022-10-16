import 'package:flutter/material.dart';
import 'package:golf_score/total_shots.dart';
import 'package:provider/provider.dart';
import 'hole_details.dart';

final List<String> holesList = <String>[];

int total = 0;
makeList() {
  for (var i = 1; i < 10; i++) {
    holesList.add("Hole $i");
  }
}

class ScoreInput extends StatefulWidget {
  const ScoreInput({Key? key}) : super(key: key);

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  @override
  void initState() {
    makeList();
    print(holesList.last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // TotalShots totalShots = Provider.of<TotalShots>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Input Sheet"),
        backgroundColor: Colors.green,
      ),
      body: Consumer(
        builder: (context, TotalShots value, child) {
          total = value.totalShotsPlayed;
          return Column(
            children: [
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
                  children: holesList
                      .map((e) => HoleDetails(width: width, holeNum: e, holeScore: value.eachHoleScore[int.parse(e) -1] ))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
