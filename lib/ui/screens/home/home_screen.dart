import 'package:flutter/material.dart';
import 'package:flutter_skate_ui/data/memory/in_memory_skates.dart';
import 'package:flutter_skate_ui/ui/screens/skateboard_ejes/skate_eje_screen.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

const _duration = Duration(milliseconds: 500);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded),
                  iconSize: 25,
                ),
                const Text(
                  'SkateboardsShop',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_rounded),
                  iconSize: 25,
                ),
              ],
            ),
            const Column(
              children: [
                Text(
                  'Choose your board',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nike'),
                    Text('Adidas'),
                    Text('SkateDeluxe'),
                  ],
                )
              ],
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Hero(
      tag: index,
      child: SizedBox(
        width: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                //reverseTransitionDuration: const Duration(milliseconds: 250),
                transitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (context, animation, _) {
                  return SkateEjeScreen(
                    productSkate: skates[_currentPage],
                    tapHero: _currentPage,
                  );
                },
              ),
            );
          },
          child: Image.asset(
            skates[index].image,
          ),
        ),
      ),
    );
  }
}
