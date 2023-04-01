import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario, colorSecundario;
  final double grosorSecundario, grosorPrimario;

  RadialProgress(
      {required this.porcentaje,
      required this.colorPrimario,
      required this.colorSecundario,
      required this.grosorPrimario,
      required this.grosorSecundario});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgressPainter(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorSecundario,
                  widget.grosorPrimario),
            ),
            //child: Text(widget.porcentaje.toString()),
          );
        });
  }
}

class _MiRadialProgressPainter extends CustomPainter {
  final porcentaje;
  final Color colorPrimario, colorSecundario;
  final double grosorSecundario, grosorPrimario;

  _MiRadialProgressPainter(this.porcentaje, this.colorPrimario,
      this.colorSecundario, this.grosorSecundario, this.grosorPrimario);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final Gradient gradiente = const LinearGradient(
        colors: <Color>[Colors.blue, Colors.green, Colors.red]);

    //círculo completo
    final lapiz = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, lapiz);

    final Rect rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);

    //arco
    final lapizArco = Paint()
      ..strokeWidth = grosorPrimario
      ..shader = gradiente.createShader(rect)
      //..color = colorPrimario
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    /* 
      final lapizArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
       */

    //parte por llenar
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, lapizArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    //throw UnimplementedError();
  }
}


/* 
class CircularProgressPage extends StatefulWidget {
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      //print('valor controller: ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          color: Colors.white12,
          child: CustomPaint(
            painter: _MiRadialProgressPainter(porcentaje),
          ),
        ),
      ),
    );
  }
}
 */