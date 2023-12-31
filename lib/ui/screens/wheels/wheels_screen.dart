import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_skate_ui/data/memory/in_memory_wheels.dart';
import 'package:flutter_skate_ui/domain/models/eje_model.dart';

class WheelsScreen extends StatefulWidget {
  const WheelsScreen({
    Key? key,
    required this.productEje,
    required this.tapHero,
    required this.skate,
  }) : super(key: key);

  final Eje productEje;
  final int tapHero;
  final String skate;

  @override
  State<WheelsScreen> createState() => _WheelsScreenState();
}

class _WheelsScreenState extends State<WheelsScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  Positioned.fill(
                    bottom: -70,
                    left: 80,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 650),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Hero(
                          tag: 'wheels${widget.tapHero}',
                          transitionOnUserGestures:
                              FutureBuilder.debugRethrowError,
                          child: Image(
                            image: AssetImage(
                              widget.productEje.image_eje,
                            ),
                          ),
                          //),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: size.height * 0.12,
                    right: size.height * 0.12,
                    child: TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1500),
                      tween: Tween<double>(begin: 1.0, end: 0.0),
                      curve: Curves.ease,
                      builder: (context, value, Widget? child) {
                        return value != 0.0
                            //============== Wheels pull bottom ============
                            ? Transform.translate(
                                offset: Offset(0, -350 * value),
                                child: Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: value * 12,
                                  child: Image(
                                    width: 180,
                                    image: AssetImage(
                                      wheels[currentPage].image_t,
                                    ),
                                  ),
                                ),
                              )
                            //============== Wheels turn 360° ============
                            : TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 750),
                                tween: Tween<double>(
                                    begin: 0.0, end: currentPage.toDouble()),
                                curve: Curves.ease,
                                builder: (context, turn, child) {
                                  return Transform.rotate(
                                    alignment: Alignment.center,
                                    angle: turn * 12,
                                    child: Image(
                                      width: 180,
                                      image: AssetImage(
                                        wheels[currentPage].image_t,
                                      ),
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //================== Information Wheels =====================
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
                    duration: const Duration(milliseconds: 650),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -100 * value),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: Text(
                            key: Key(wheels[currentPage].name),
                            wheels[currentPage].name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
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
                          currentPage = index;
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
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: Text(
                            key: Key(wheels[currentPage].name),
                            '\$${wheels[currentPage].price.toString()}.00',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                            ),
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
                  // Slider(
                  //   value: _value,
                  //   min: 0,
                  //   autofocus: true,
                  //   max: 5,
                  //   onChangeStart: (value) {
                  //     setState(() {
                  //       _value = value;
                  //     });
                  //   },
                  //   onChangeEnd: (value) {
                  //     setState(() {
                  //       _value = value;
                  //     });
                  //   },
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
