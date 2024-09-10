import 'package:flutter/material.dart';

class Teamexisting extends StatefulWidget {
  const Teamexisting({super.key});

  @override
  State<Teamexisting> createState() => _TeamexistingState();
}

class _TeamexistingState extends State<Teamexisting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Team Existing Screen!!',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
