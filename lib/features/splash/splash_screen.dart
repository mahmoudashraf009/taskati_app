import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/features/splash/splash_screen.dart';
import '../home/widgets/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/splash_image.json"),
            Text("Taskati",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            Text("it's time to get organized",style: TextStyle(
              fontSize: 18,
            ),)
          ],
        ),
      ),
    );
  }
}
