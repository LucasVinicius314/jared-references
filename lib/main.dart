import 'package:flutter/material.dart';
import 'package:jared_references/core/home.dart';
import 'package:jared_references/services/shared_preferences.dart';
import 'package:jared_references/utils/constants.dart';
import 'package:jared_references/utils/themes.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _theme = Themes.light;

  Future<void> _toggleTheme() async {
    final targetTheme = _theme == Themes.light ? Themes.dark : Themes.light;

    await Prefs.setTheme(targetTheme);

    setState(() {
      _theme = targetTheme;
    });
  }

  @override
  void initState() {
    super.initState();

    Future(() async {
      final theme = await Prefs.getTheme();

      if (theme != null) {
        setState(() {
          _theme = theme;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: Home(toggleTheme: _toggleTheme),
      theme: _theme == Themes.light ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
