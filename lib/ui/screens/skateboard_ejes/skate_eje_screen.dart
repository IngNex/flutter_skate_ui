// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_skate_ui/data/memory/in_momory_ejes.dart';

import 'package:flutter_skate_ui/domain/models/skate_model.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class SkateEjeScreen extends StatefulWidget {
  const SkateEjeScreen({
    Key? key,
    required this.productSkate,
    required this.tapHero,
  }) : super(key: key);

  final Skate productSkate;
  final int tapHero;

  @override
  State<SkateEjeScreen> createState() => _SkateEjeScreenState();
}

class _SkateEjeScreenState extends State<SkateEjeScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                // IconButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   icon: const Icon(Icons.arrow_back),
                //   iconSize: 25,
                // ),
                const Text(
                  'Eje Skateboards',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
            SizedBox(
              height: 120,
              child: ScrollSnapList(
                itemBuilder: _buildListItem,
                itemCount: ejes.length,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 500),
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(100 * value, 0),
                          child: Text(
                            ejes[_currentPage].name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 10),
                  Text(
                    '\$${ejes[_currentPage].price.toString()}.00',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => SkateEjeScreen(
                      //     productSkate: skates[_currentPage],
                      //     tapHero: _currentPage,
                      //   ),
                      // ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: -80,
                    child: Hero(
                      tag: widget.tapHero,
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
                  Positioned.fill(
                    bottom: 380,
                    child: Image(
                      image: AssetImage(
                        ejes[_currentPage].image_back,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: -40,
                    child: Image.asset(
                      ejes[_currentPage].image_fron,
                    ),
                  ),
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
        ejes[index].image_fron,
      ),
    );
  }
}
