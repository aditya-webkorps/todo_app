import 'package:day15_todo/list_to_do_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("Inside initState");
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToNextPage();
    });
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ListToDoPage(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    debugPrint("Inside dispose");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Inside build");
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash_screen.jpg",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3),
                child: Text(
                  "Developed by Aditya",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
