import 'package:flutter/material.dart';

class Teamcreation extends StatefulWidget {
  const Teamcreation({super.key});

  @override
  State<Teamcreation> createState() => _TeamcreationState();
}

class _TeamcreationState extends State<Teamcreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Team Screen!!',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
