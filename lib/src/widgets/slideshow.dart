import 'package:custom_painter/src/models/slider_model.dart';
import 'package:flutter/material.dart';
//borrar
//import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario, colorSecundario;

  const Slideshow(
      {required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            if (this.puntosArriba)
              _Dots(
                  this.slides.length, this.colorPrimario, this.colorSecundario),
            Expanded(child: _Slides(this.slides)),
            if (!this.puntosArriba)
              _Dots(
                  this.slides.length, this.colorPrimario, this.colorSecundario),
          ],
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario, colorSecundario;
  _Dots(this.totalSlides, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: /*  [_Dot(0), _Dot(1), _Dot(2)] */
              List.generate(
                  this.totalSlides,
                  (index) =>
                      _Dot(index, this.colorPrimario, this.colorSecundario))
          /*  this
                .slides
                .map((slide) => _Dot(this.slides.indexOf(slide)))
                .toList(), */
          ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario, colorSecundario;

  _Dot(this.index, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? this.colorPrimario
              : this.colorSecundario,
          shape: BoxShape.circle),
      duration: Duration(milliseconds: 200),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-1.svg')
class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
        /*children: <Widget>[
          const _Slide('assets/svgs/slide-1.svg'),
          const _Slide('assets/svgs/slide-2.svg'),
          const _Slide('assets/svgs/slide-3.svg') 
        ],*/
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: svg
        //SvgPicture.asset(svg),
        );
  }
}
