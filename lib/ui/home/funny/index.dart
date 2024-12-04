import 'package:flutter/material.dart';

class FunnyPage extends StatefulWidget {
  const FunnyPage({super.key});

  @override
  _FunnyPageState createState() => _FunnyPageState();
}

class _FunnyPageState extends State<FunnyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('搞笑'),
      ),
    );
  }
}
