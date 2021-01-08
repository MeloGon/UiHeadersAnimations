import 'package:flutter/material.dart';
import 'package:ui_app/src/pages/animaciones_page.dart';

class AnimacionReto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CuadradoAnimado()));
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> movDerecha;
  Animation<double> movArriba;
  Animation<double> movIzquierda;
  Animation<double> movAbajo;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    movDerecha = Tween(begin: 0.0, end: 152.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));
    movArriba = Tween(begin: 0.0, end: -152.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));
    movIzquierda = Tween(begin: 0.0, end: -152.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.50, 0.75, curve: Curves.bounceOut)));
    movAbajo = Tween(begin: 0.0, end: 152.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: Cuadrado(),
      builder: (BuildContext context, Widget childCuadrado) {
        return Transform.translate(
            offset: Offset(movDerecha.value, 0),
            child: Transform.translate(
                offset: Offset(0, movArriba.value),
                child: Transform.translate(
                    offset: Offset(movIzquierda.value, 0),
                    child: Transform.translate(
                        offset: Offset(0, movAbajo.value),
                        child: childCuadrado))));
      },
    );
  }
}

class Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
