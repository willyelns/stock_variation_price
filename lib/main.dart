import 'package:flutter/material.dart';
import 'package:stock_variation/injection_container.dart'
    as injection_container;
import 'package:stock_variation/routes/routes.dart';

Future<void> main() async {
  await injection_container.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
