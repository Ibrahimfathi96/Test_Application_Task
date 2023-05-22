import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/view/change_color_view.dart';
import 'package:test_application/viewmodel/change_color_viewmodel.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ChangeColorViewModel(),
      child: const TestApplication()));
}

class TestApplication extends StatelessWidget {

  const TestApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ChangeColorView.routeName,
      home: const ChangeColorView(),
    );
  }
}

