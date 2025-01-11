import 'package:flutter/material.dart';

const String appName = "Tasty Food";

const String slogan = "Delivery App";

const primaryColor = Color.fromARGB(255, 240, 155, 94);

const bgImage = "assets/food.jpg";

const loginScreen = "Login";

const forgotText = "Fogot Password";
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}