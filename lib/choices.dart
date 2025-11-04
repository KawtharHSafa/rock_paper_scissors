import 'dart:math';

import 'package:flutter/material.dart';

// ✋ 👊 ✌  ❓

class Choices extends StatefulWidget{
  const Choices({super.key});
@override
  State<Choices> createState() => _ChoiceState();

}

class _ChoiceState extends State<Choices>{
var _yourChoice = "❓";
var _computerChoice = "❓";
var _yourScore = 0;
var _computerScore = 0;
var choices = ["👊", "✋", "✌"];
  void getRock(){
    setState(() {
      _yourChoice = "👊";
      setComputerChoice();
    });
  }
void getPaper(){
    setState(() {
      _yourChoice = "✋";
      setComputerChoice();
    });
  }
void getScissors(){
    setState(() {
      _yourChoice = "✌";
      setComputerChoice();
    });
  }

void setComputerChoice(){
  setState(() {
    int index=Random().nextInt(3);
    _computerChoice = choices[index];
    updateScore();
  });
}
void updateScore(){
  if(_yourChoice == _computerChoice){
    return;
  }
  else if((_yourChoice == "👊" && _computerChoice == "✌") ||
          (_yourChoice == "✋" && _computerChoice == "👊") ||
          (_yourChoice == "✌" && _computerChoice == "✋")){
            _yourScore += 1;
          }
  else{
       _computerScore += 1;
    }
}

void replay(){
  setState(() {
    _yourChoice = "❓";
    _computerChoice = "❓";
    _yourScore = 0;
    _computerScore = 0;
  });
}
@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
          children: [
            Text("Your choice: "),
            Text(_yourChoice),
          ],
        ),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
          children: [
            Text("Computer's choice: "),
            Text(_computerChoice),

          ],
        ),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
        ElevatedButton(onPressed: getRock, child: Text("👊")),
        ElevatedButton(onPressed: getPaper, child: Text("✋")),
        ElevatedButton(onPressed: getScissors , child: Text("✌")),
      ],
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("your Score:"),
          Text(_yourScore.toString()),
          Text("Computer's Score:"),
          Text(_computerScore.toString()),
        ],
      ),
      ElevatedButton(onPressed: replay, child: Text("⟳")),
      ],
    );
  }
}

