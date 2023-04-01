import 'package:custom_painter/src/pages/animaciones_page.dart';
import 'package:custom_painter/src/labs/circular_progress_page.dart';
import 'package:custom_painter/src/pages/graficas_circulares_page.dart';
import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/retos/cuadrado_anim.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //bounceout

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños app',
        home: GraficasCircularesPage());
  }
}
