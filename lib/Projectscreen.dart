import 'package:flutter/material.dart';

class Projectscreen extends StatefulWidget {
  const Projectscreen({super.key});

  @override
  State<Projectscreen> createState() => _ProjectscreenState();
}

class _ProjectscreenState extends State<Projectscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Project Screen!!',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
