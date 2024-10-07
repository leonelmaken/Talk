import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../home/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Utilise MediaQuery pour rendre l'écran responsive
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo animé responsive
            SizedBox(
              width: shortestSide * 0.5,
              height: shortestSide * 0.5,
              child: Lottie.asset(
                'assets/animations/talk_loader.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            SizedBox(height: 20),
            // Texte responsive
            Text(
              'Talk',
              style: TextStyle(
                fontSize: shortestSide * 0.08,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Power By leonelmaken