import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../home/presentation/pages/home_screen.dart';

/// SplashScreen est le premier écran affiché lors du lancement de l'application.
/// Il présente une animation de chargement et le logo de l'application.
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
    // Initialise le contrôleur d'animation
    _controller = AnimationController(vsync: this);
    
    // Configure un listener pour détecter la fin de l'animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigue vers l'écran d'accueil une fois l'animation terminée
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    // Libère les ressources du contrôleur d'animation
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
            // Animation Lottie responsive
            SizedBox(
              width: shortestSide * 0.5,
              height: shortestSide * 0.5,
              child: Lottie.asset(
                'assets/animations/talk_loader.json',
                controller: _controller,
                onLoaded: (composition) {
                  // Configure la durée de l'animation et la démarre
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            SizedBox(height: 20),
            // Texte "Talk" responsive
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

// Powered by leonelmaken