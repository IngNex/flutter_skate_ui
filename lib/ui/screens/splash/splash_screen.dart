import 'package:flutter/material.dart';
import 'package:flutter_skate_ui/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              child: const HomeScreen(),
            );
          },
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 650),
            curve: Curves.ease,
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 850),
              curve: Curves.ease,
              tween: Tween<double>(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, 100 * value),
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 25, 24, 24)
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Hero(
                          tag: 'logo',
                          child: Image(
                            image: AssetImage(
                              'assets/image/logo_skate.png',
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Transform.translate(
                      offset: Offset(0, 150 * value),
                      child: const Text(
                        'SKATEBOARDS',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            left: 0,
            right: 0,
            child: const Text(
              '© byMaicolDev',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
