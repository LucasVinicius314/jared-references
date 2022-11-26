import 'package:flutter/material.dart';
import 'package:jared_references/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.toggleTheme}) : super(key: key);

  final void Function() toggleTheme;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.appName)),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: widget.toggleTheme,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(32.0),
                ),
              ),
              child: const Text('Toggle theme'),
            ),
            Text(
              'Sure, 2022',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.overline,
            ),
          ],
        ),
      ),
    );
  }
}
