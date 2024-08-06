import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/detail.dart';
import 'src/update.dart';
import 'src/search.dart';
import 'package:provider/provider.dart';
import 'src/products.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MYApp(),
    ),
  );
}

class MYApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/update': (context) => up(),
        '/detail': (context) => Detail(),
        '/search': (context) => Search(),
      },
    );
  }
}
