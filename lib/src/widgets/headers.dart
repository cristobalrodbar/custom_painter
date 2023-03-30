import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
      height: 300,
      //color: Color(0xff615AAB),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xffff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
    /* return Transform.rotate(
      angle: -0.09,
      child: Transform.scale(
        scale: 1.1,
        child: Container(
          height: 300,
          color: Color(0xff615AAB),
        ),
      ),
    ); */
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final lapiz = Paint();
    //propiedades
    lapiz.color = Color(0xffff615AAB);
    lapiz.style = PaintingStyle.fill;
    //lapiz.style = PaintingStyle.stroke;

    lapiz.strokeWidth = 2;

    final path = Path();
    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(0, 0); //arriba izquierda
    path.lineTo(size.width, 0); //arriba derecha
    path.lineTo(size.width, size.height * 0.30); //derecha abajo
    path.lineTo(0, size.height * 0.5); //arriba  abajo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    //throw UnimplementedError();
  }
}

class HeaderTriangularPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xffff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPicoPainter(),
      ),
    );
    /* return Transform.rotate(
      angle: -0.09,
      child: Transform.scale(
        scale: 1.1,
        child: Container(
          height: 300,
          color: Color(0xff615AAB),
        ),
      ),
    ); */
  }
}

class _HeaderTriangularPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final lapiz = Paint();
    //propiedades
    lapiz.color = Color.fromARGB(255, 116, 8, 99);
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 2;

    final path = Path();

    //header triangulo
    //path.lineTo(size.width, size.height);
    //path.lineTo(size.width, 0);

    //header pico
    //path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width * 0.5, size.height * 0.3);
    //path.lineTo(size.width, size.height * 0.25);
    //path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    //throw UnimplementedError();
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xffff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
    /* return Transform.rotate(
      angle: -0.09,
      child: Transform.scale(
        scale: 1.1,
        child: Container(
          height: 300,
          color: Color(0xff615AAB),
        ),
      ),
    ); */
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final lapiz = Paint();
    //propiedades
    lapiz.color = Color.fromARGB(255, 60, 101, 36);
    lapiz.style = PaintingStyle.fill;

    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    //throw UnimplementedError();
  }
}
