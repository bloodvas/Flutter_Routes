import 'package:flutter/material.dart';

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
                      .pushNamedAndRemoveUntil('/screen2', (route) => false),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color.fromARGB(157, 41, 41, 41)),
                  ),
                ),
                TextButton(
                  onPressed: () => Future.delayed(
                    const Duration(seconds: 1),
                    (() {
                      Navigator.of(context).pop('Cancel');
                    }),
                  ),
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
