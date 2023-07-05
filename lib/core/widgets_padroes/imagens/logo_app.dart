import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double? width;
  final double? height;
  const LogoApp({this.width, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      image: const AssetImage('assets/logo.png'),
    );
  }
}
