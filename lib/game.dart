import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  double top = 0;

  double left = 0;

  final screenWidth = 500;

  final screenHeight = 500;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth.toDouble(),
        height: screenHeight.toDouble(),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFF000000)),
          left: BorderSide(width: 1.0, color: Color(0xFF000000)),
          right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
        )),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: top,
              left: left,
              duration: const Duration(seconds: 1),
              child: const Icon(
                Icons.adb,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (top == 0) {
                    top += 100;
                  }
                  top -= 100;
                }),
                child: Container(
                  margin: const EdgeInsets.only(left: 100, bottom: 40),
                  width: 50,
                  height: 50,
                  child: const Text('up'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (top == screenHeight - 200) {
                    top -= 100;
                  }
                  top += 100;
                }),
                child: Container(
                  margin: const EdgeInsets.only(left: 95),
                  width: 50,
                  height: 50,
                  child: const Text('down'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (left == 0) {
                    left += 100;
                  }
                  left -= 100;
                }),
                child: Container(
                  margin: const EdgeInsets.only(left: 50),
                  width: 50,
                  height: 50,
                  child: const Text('left'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (left == screenWidth - 100) {
                    left -= 100;
                  }
                  left += 100;
                }),
                child: Container(
                  margin: const EdgeInsets.only(left: 150),
                  width: 50,
                  height: 50,
                  child: const Text('right'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
