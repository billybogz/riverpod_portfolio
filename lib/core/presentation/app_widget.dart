import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      alignment: AlignmentDirectional.bottomCenter,
      height: 72.0,
      disconnectedText: 'No internet connection. Retrying..',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
