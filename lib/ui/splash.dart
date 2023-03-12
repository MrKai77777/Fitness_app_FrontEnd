import 'package:fitness_app/ui/login_screen.dart';
import 'package:flutter/material.dart';

import '../helper/const.dart';
import '../helper/storage_manager.dart';
import 'mainpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/947a9f1acf2478edc6e97b9a17ef75aa.jpg"),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool isLoggedIn = false;

  isUserLoggedIn() async {
    var token = await StorageManager.readData(bearerToken);
    if (token != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await isUserLoggedIn();
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
