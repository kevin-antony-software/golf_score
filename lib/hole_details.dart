import 'package:flutter/material.dart';
import 'package:golf_score/score_input.dart';
import 'package:provider/provider.dart';

const List<int> list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
int dropdownValue = list.first;

class HoleDetails extends StatefulWidget {
  const HoleDetails({
    Key? key,
    required this.width,
    required this.holeNum,
  }) : super(key: key);

  final String holeNum;
  final double width;

  @override
  State<HoleDetails> createState() => _HoleDetailsState();
}

class _HoleDetailsState extends State<HoleDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TotalShots>(
      builder: (BuildContext context, TotalShots totalValue, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lime[600],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widget.width * 0.8,
                  child: Text(
                    widget.holeNum,
                    style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.grey,
                      width: 3,
                    ),
                  ),
                  width: widget.width * 0.15,
                  child: DropdownButton<int>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.brown),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                        totalValue.add(value);
                      });
                    },
                    items: list.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
