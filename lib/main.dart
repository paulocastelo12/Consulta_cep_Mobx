import 'package:aprendendo_mobx_consultacep/screens/home_screen.dart';
import 'package:aprendendo_mobx_consultacep/stores/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    ),
    providers: [
      Provider<Controller>(
        create: (_) => Controller(),
      )
    ],
    );
  }
}