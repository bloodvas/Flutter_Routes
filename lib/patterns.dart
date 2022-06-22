import 'package:flutter/material.dart';
import 'package:flutter_application_2/game.dart';

class PatternOfPage extends StatefulWidget {
  final String title;
  final String nextPage;

  const PatternOfPage(this.title, this.nextPage, {Key? key}) : super(key: key);

  @override
  State<PatternOfPage> createState() => _PatternOfPageState();
}

class _PatternOfPageState extends State<PatternOfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(225, 28, 27, 27),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsetsDirectional.all(40),
            child: FloatingActionButton.extended(
              onPressed: () {
                if (widget.nextPage == '/screen2') {
                  Navigator.of(context).pushReplacementNamed(widget.nextPage);
                } else {
                  Navigator.of(context).pushNamed(widget.nextPage);
                }
              },
              label: const Text('Next Page', style: TextStyle()),
            ),
          ),
          const Game(),
        ]),
      ),
    );
  }
}
