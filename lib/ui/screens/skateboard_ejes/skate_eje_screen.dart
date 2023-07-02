import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_skate_ui/data/memory/in_memory_trucks.dart';
import 'package:flutter_skate_ui/domain/models/skate_model.dart';
import 'package:flutter_skate_ui/ui/screens/sketboard_wheels/sketboard_wheels_screen.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class SkateboardEjeScreen extends StatefulWidget {
  const SkateboardEjeScreen({
    Key? key,
    required this.productSkate,
    required this.tapHero,
  }) : super(key: key);

  final Skate productSkate;
  final int tapHero;

  @override
  State<SkateboardEjeScreen> createState() => _SkateboardEjeScreenState();
}

class _SkateboardEjeScreenState extends State<SkateboardEjeScreen> {
  int _currentPage = 0;
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
                        'Eje Skateboards',
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
                  const Text(
                    'Choose your trucks',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -100 * value),
                        child: Text(
                          ejes[_currentPage].name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    },
                  ),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 700),
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, -100 * value),
                        child: Text(
                          '\$${ejes[_currentPage].price.toString()}.00',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                    child: ScrollSnapList(
                      itemBuilder: _buildListItem,
                      itemCount: ejes.length,
                      itemSize: 120,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          reverseTransitionDuration:
                              const Duration(milliseconds: 650),
                          transitionDuration: const Duration(milliseconds: 650),
                          pageBuilder: (context, animation, _) {
                            return FadeTransition(
                              opacity: animation,
                              child: SkateboardWheelsScreen(
                                productEje: ejes[_currentPage],
                                tapHero: _currentPage,
                                skate: widget.productSkate.image,
                              ),
                            );
                          },
                        ),
                      );
                    },
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
            Expanded(
              child: Container(
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
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: -80,
                      child: Hero(
                        tag: 'skate_${widget.tapHero}',
                        child: Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(-pi * 0.4)
                            ..scale(1.2),
                          child: Image(
                            image: AssetImage(widget.productSkate.image),
                          ),
                        ),
                      ),
                    ),
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 700),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Positioned.fill(
                          bottom: 380,
                          child: Hero(
                            tag: 'wheels_${_currentPage}',
                            child: Transform.translate(
                              offset: Offset(0, -240 * value),
                              child: Image(
                                image: AssetImage(
                                  ejes[_currentPage].image_back,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 700),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, _) {
                        return Positioned.fill(
                          bottom: -40,
                          child: Hero(
                            tag: 'wheels_${_currentPage}_fron',
                            child: Transform.translate(
                              offset: Offset(0, -480 * value),
                              child: Image.asset(
                                ejes[_currentPage].image_fron,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Hero(
      tag: 'wheels${index}',
      child: SizedBox(
        width: 120,
        child: Image.asset(
          ejes[index].image_eje,
        ),
      ),
    );
  }
}
