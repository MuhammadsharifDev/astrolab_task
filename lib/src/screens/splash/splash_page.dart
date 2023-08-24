import 'package:astrolabb_task/src/const/utils/app_images.dart';
import 'package:astrolabb_task/src/routes/route_name.dart';
import 'package:flutter/material.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacementNamed(context, RoutesName.login));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(AppImages.splash,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 400,
                  left: 120,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Welco', style: TextStyle(fontWeight: FontWeight.w400,color: Colors.red,fontSize: 48),),
                        TextSpan(text: 'me',style: TextStyle(color: Colors.brown,fontSize: 48),),
                      ],
                    ),
                  ),),
              ],
            ),
          ],
        ),),

    );
  }
}