import 'dart:developer';

import 'package:flutter/material.dart';

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
              nextPage: '/',
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
    return MyStack(widget.title, widget.nextPage);
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
    return MyStack(widget.title, widget.nextPage);
    // return Navigator(
    //   initialRoute: path,
    //   onGenerateRoute: (RouteSettings settings) {
    //     WidgetBuilder builder;
    //     switch (settings.name) {
    //       case path:
    //         builder = (BuildContext context) =>
    //             MyStack(widget.title, widget.nextPath);
    //         break;
    //       default:
    //         throw Exception('Invalid route: ${settings.name}');
    //     }
    //     return MaterialPageRoute<void>(builder: builder, settings: settings);
    //   },
    // );
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
    return MyStack(widget.title, widget.nextPage);
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
      MyStack(widget.title, widget.nextPage),
      const Center(child: MyDialog())
    ]);
  }
}

class MyStack extends StatelessWidget {
  final String title;
  final String nextPage;

  const MyStack(this.title, this.nextPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(225, 28, 27, 27),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: const Color.fromARGB(225, 28, 27, 27),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color.fromARGB(170, 255, 255, 255),
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsetsDirectional.all(40),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed(nextPage);
              },
              label: const Text('Next Page', style: TextStyle()),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Center(child: Text('Go to homePage?')),
          content: const Icon(
            Icons.home,
            color: Color.fromARGB(157, 41, 41, 41),
            size: 100,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color.fromARGB(157, 41, 41, 41)),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop('Cansel'),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Color.fromARGB(157, 41, 41, 41)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
