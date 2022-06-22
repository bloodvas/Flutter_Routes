import 'package:flutter/material.dart';
import 'package:flutter_application_2/dialog_pages.dart';
import 'package:flutter_application_2/patterns.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyHomePage(
            title: 'Flutter Demo Home Page', nextPage: '/screen2'),
        '/screen2': (BuildContext context) => const Second(
              title: 'Second Page',
              nextPage: '/screen3',
            ),
        '/screen3': (BuildContext context) => const Third(
              title: 'Third Page',
              nextPage: '/screen4',
            ),
        '/screen4': (BuildContext context) => const Fourth(
              title: 'Fourth Page',
              nextPage: '/screen2',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.nextPage})
      : super(key: key);
  final String title;
  final String nextPage;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PatternOfPage(widget.title, widget.nextPage);
  }
}

class Second extends StatefulWidget {
  const Second({Key? key, required this.title, required this.nextPage})
      : super(key: key);
  final String title;
  final String nextPage;

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return PatternOfPage(widget.title, widget.nextPage);
  }
}

class Third extends StatefulWidget {
  const Third({Key? key, required this.title, required this.nextPage})
      : super(key: key);
  final String title;
  final String nextPage;

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return PatternOfPage(widget.title, widget.nextPage);
  }
}

class Fourth extends StatefulWidget {
  const Fourth({Key? key, required this.title, required this.nextPage})
      : super(key: key);
  final String title;
  final String nextPage;

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PatternOfPage(widget.title, widget.nextPage),
      Center(
          child: Container(
        margin: const EdgeInsets.only(bottom: 100),
        child: const MyDialog(),
      )),
    ]);
  }
}
