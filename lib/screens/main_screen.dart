import 'dart:math';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isGameStarted = false;

  final Map<String, int> myDice = {
    "images/dice1.png": 1,
    "images/dice2.png": 2,
    "images/dice3.png": 3,
    "images/dice4.png": 4,
    "images/dice5.png": 5,
    "images/dice6.png": 6,
  };

  String? firstDice;
  String? secondDice;

  List<Image> myDiceImg = [];

  @override
  void initState() {
    super.initState();
    myDice.addAll(myDice);
  }

  void startGame() {
    setState(() {
      isGameStarted = true;
    });

    myDiceImg = [];

    Random random = Random();
    String diceOneKey =
    myDice.keys.elementAt(random.nextInt(myDice.length));
    String diceTwoKey =
    myDice.keys.elementAt(random.nextInt(myDice.length));

    firstDice = diceOneKey;
    secondDice = diceTwoKey;

    myDiceImg.add(Image.asset(firstDice!));
    myDiceImg.add(Image.asset(secondDice!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isGameStarted
          ? SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: myDiceImg.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: myDiceImg[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: startGame,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("Roll"),
                  )
                ],
              ),
            )
          : Center(
              child: MaterialButton(
                  onPressed: startGame,
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text("Start Game")),
            ),
    );
  }
}
