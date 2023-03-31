import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CuadradoAnimado(),
    ));
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;

  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 4 * Math.pi).animate(/* controller */
        CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller);
    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      //print('status ' + controller.status.toString());
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
      } /* else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      } */
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //controller.repeat();
    controller.forward();
    return AnimatedBuilder(
        child: _Rectangulo(),
        animation: controller,
        builder: (context, child) {
          print('opacidad ' + opacidad.value.toString());

          return Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                  opacity: opacidad.value - opacidadOut.value,
                  child: Transform.scale(
                    child: child,
                    /*  child: Opacity(
                      opacity: opacidadOut.value,
                      child: child,
                    ), */
                    scale: agrandar.value,
                  ),
                )
                //_Rectangulo(),
                ),
          );
        });
    //_Rectangulo();
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
