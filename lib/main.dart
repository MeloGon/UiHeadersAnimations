import 'package:flutter/material.dart';
import 'package:ui_app/src/pages/animaciones_page.dart';
import 'package:ui_app/src/pages/animacionreto_page.dart';
import 'package:ui_app/src/pages/headers_page.dart';
import 'package:ui_app/src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: SlideShowPage());
  }
}
