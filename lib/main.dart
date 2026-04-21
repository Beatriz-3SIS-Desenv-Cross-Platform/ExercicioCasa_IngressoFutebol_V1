import 'package:flutter/material.dart';
import 'package:ingressos/screens/compra_screen.dart';

void main() {
  runApp(const IngressosApp());
}

class IngressosApp extends StatelessWidget {
  const IngressosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CompraScreen(),
    );
  }
}
