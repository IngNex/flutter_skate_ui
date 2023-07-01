import 'package:flutter/material.dart';
import 'package:flutter_skate_ui/data/memory/in_memory_skates.dart';
import 'package:flutter_skate_ui/ui/screens/skateboard_ejes/skate_eje_screen.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        onPressed: () {},
                        icon: const Icon(Icons.menu_rounded),
                        iconSize: 25,
                      ),
                      const Text(
                        'Skateboards',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_rounded),
                        iconSize: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Nike'),
                      Text('Adidas'),
                      Text('Deluxe'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choose your board',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollSnapList(
                itemBuilder: _buildListItem,
                itemCount: skates.length,
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  Text(
                    skates[_currentPage].name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$ ${skates[_currentPage].price}.00',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
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
                              child: SkateboardEjeScreen(
                                productSkate: skates[_currentPage],
                                tapHero: _currentPage,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
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
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        //color: Colors.red,
        image: DecorationImage(
          opacity: 0.2,
          image: AssetImage(
            skates[index].image,
          ),
        ),
      ),
      child: Hero(
        tag: 'skate_${index}',
        child: Image.asset(
          skates[index].image,
        ),
      ),
    );
  }
}
