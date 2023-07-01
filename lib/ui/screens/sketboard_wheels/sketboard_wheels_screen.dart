import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_skate_ui/data/memory/in_memory_wheels.dart';
import 'package:flutter_skate_ui/domain/models/eje_model.dart';

class SkateboardWheelsScreen extends StatefulWidget {
  const SkateboardWheelsScreen({
    Key? key,
    required this.productEje,
    required this.tapHero,
    required this.skate,
  }) : super(key: key);

  final Eje productEje;
  final int tapHero;
  final String skate;

  @override
  State<SkateboardWheelsScreen> createState() => _SkateboardWheelsScreenState();
}

class _SkateboardWheelsScreenState extends State<SkateboardWheelsScreen> {
  int _currentPage = 0;
  //double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 25,
                      ),
                      const Text(
                        'Wheels Skate',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart),
                        iconSize: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Choose your wheels',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Trucks: ',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.productEje.name,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              //height: 400,
              child: Stack(
                children: [
                  // Positioned.fill(
                  //   bottom: 380,
                  //   child: Transform(
                  //     alignment: Alignment.topCenter,
                  //     transform: Matrix4.identity()
                  //       ..setEntry(3, 2, 0.001)
                  //       ..rotateY(-pi * 0.5)
                  //       ..scale(1.2),
                  //     child: Hero(
                  //       tag: 'wheels_${widget.tapHero}',
                  //       child: Image(
                  //         image: AssetImage(
                  //           widget.productEje.image_back,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned.fill(
                  //   bottom: -40,
                  //   child: Transform(
                  //     alignment: Alignment.topCenter,
                  //     transform: Matrix4.identity()
                  //       ..setEntry(3, 2, 0.001)
                  //       ..rotateY(-pi * 0.5)
                  //       ..scale(1.0),
                  //     child: Hero(
                  //       tag: 'wheels_${widget.tapHero}_fron',
                  //       child: Image(
                  //         image: AssetImage(
                  //           widget.productEje.image_fron,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Hero(
                  //   tag: 'wheels_${widget.tapHero}',
                  //   child: Image(
                  //     image: AssetImage(
                  //       widget.productEje.image_back,
                  //     ),
                  //   ),
                  // ),
                  // Positioned.fill(
                  //   bottom: -225,
                  //   left: 250,
                  //   child: Hero(
                  //     tag: 'skate_${widget.tapHero}',
                  //     child: Transform.rotate(
                  //       angle: pi * 0.5,
                  //       alignment: Alignment.center,
                  //       // transform: Matrix4.identity()
                  //       //   ..setEntry(3, 2, 0.001)
                  //       //   ..rotate(-pi * _value),
                  //       // ..scale(1.2),
                  //       child: Transform(
                  //         alignment: Alignment.center,
                  //         transform: Matrix4.identity()
                  //           ..setEntry(3, 2, 0.001)
                  //           ..rotateY(-pi * 0.71)
                  //           ..scale(3.5),
                  //         child: Image(
                  //           image: AssetImage(widget.skate),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned.fill(
                    bottom: -80,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 650),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, -60 * value),
                          child: Image(
                            image: AssetImage(
                              widget.productEje.image_eje,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 65,
                    top: 70,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 650),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, -200 * value),
                          child: Image(
                            width: 180,
                            image: AssetImage(
                              wheels[_currentPage].image_t,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -100 * value),
                        child: Text(
                          wheels[_currentPage].name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ScrollSnapList(
                      itemBuilder: _buildListItem,
                      itemCount: wheels.length,
                      itemSize: 150,
                      scrollPhysics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      onItemFocus: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      dynamicItemSize: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -100 * value),
                        child: Text(
                          '\$${wheels[_currentPage].price.toString()}.00',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                        child: Text(
                          'SELECT',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Slider(
            //   value: _value,
            //   onChanged: (value) {
            //     setState(() {
            //       _value = value;
            //     });
            //   },
            // ),
            // Text(_value.toString())
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
      width: 150,
      child: Image.asset(
        wheels[index].image,
      ),
    );
  }
}
