import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
        '/': (BuildContext context) =>
            const MyHomePage(title: 'Flutter Demo Home Page', path: '/second'),
        '/second': (BuildContext context) => const Second(
              title: 'Second Page',
              nextPath: '/third',
            ),
        '/third': (BuildContext context) => const Third(
              title: 'Third Page',
              nextPath: '/fourth',
            ),
        '/fourth': (BuildContext context) => const Fourth(
              title: 'Fourth Page',
              nextPath: '/',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.path})
      : super(key: key);

  final String title;
  final String path;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromARGB(225, 28, 27, 27),
        ),
        body: MyStack(widget.title, widget.path));
  }
}

class Second extends StatelessWidget {
  const Second({Key? key, required this.title, required this.nextPath})
      : super(key: key);
  final String title;
  final String nextPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'second',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'second':
            builder = (BuildContext context) => MyStack(title, nextPath);
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class Third extends StatelessWidget {
  const Third({Key? key, required this.title, required this.nextPath})
      : super(key: key);
  final String title;
  final String nextPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'third',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'third':
            builder = (BuildContext context) => MyStack(title, nextPath);
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class Fourth extends StatelessWidget {
  const Fourth({Key? key, required this.title, required this.nextPath})
      : super(key: key);
  final String title;
  final String nextPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'fourth',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'fourth':
            builder = (BuildContext context) => MyStack(title, nextPath);
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}

class Empty extends StatelessWidget {
  final String label;
  const Empty(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      color: const Color.fromARGB(225, 28, 27, 27),
      child: Text(
        label,
        style: const TextStyle(
            color: Color.fromARGB(170, 255, 255, 255),
            decoration: TextDecoration.none),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  final String title;
  final String nextPage;

  const MyStack(this.title, this.nextPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(child: Empty(title)),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsetsDirectional.all(40),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, nextPage);
            },
            label: const Text('Next Page', style: TextStyle()),
          ),
        )
      ],
    );
  }
}
