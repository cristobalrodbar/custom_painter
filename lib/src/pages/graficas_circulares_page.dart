import 'package:custom_painter/src/widgets/radialProgress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  late double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          },
          child: Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.blue),
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.brown)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.green),
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink)
              ],
            )
          ],
        )
        /* Center(child: CustomRadialProgress(porcentaje: porcentaje)), */
        );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({required this.porcentaje, required this.color});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      //color: Colors.red,
      child: RadialProgress(
          porcentaje: porcentaje,
          colorPrimario: color,
          colorSecundario: Colors.grey,
          grosorSecundario: 4,
          grosorPrimario: 10),
      /*  child: Text(
    '${porcentaje}%',
    style: TextStyle(fontSize: 50.0),
        ), */
    );
  }
}
