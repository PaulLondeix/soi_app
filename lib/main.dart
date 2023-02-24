import 'package:flutter/material.dart';
import 'package:soi_app/screens/counters_screen.dart';
import './screens/character_selection_screen.dart';
import './screens/player_nb_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headlineTextStyle = const TextStyle(
      fontFamily: 'Futo',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyTextStyle = const TextStyle(
      fontFamily: 'Futo',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    TextTheme futoTextTheme = TextTheme(
      headline1: headlineTextStyle,
      headline2: headlineTextStyle.copyWith(fontSize: 18),
      bodyText1: bodyTextStyle,
      bodyText2: bodyTextStyle.copyWith(fontSize: 14),
      button: bodyTextStyle,
    );

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: futoTextTheme,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          PlayerNbScreen.routeName: (ctx) => const PlayerNbScreen(),
          CharacterSelectionScreen.routeName: (ctx) =>
              const CharacterSelectionScreen(),
          CountersScreen.routeName: (ctx) => const CountersScreen(),
        });
  }
}
