import 'package:app/app/branch.dart';
import 'package:app/app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool animated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        setState(() {
          animated = true;
        });

        return Future.delayed(const Duration(seconds: 1));
      },
    ).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: animated ? MediaQuery.of(context).size.width * .5 : 0,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SvgPicture.asset(
            Branch.logos['icon']!,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
