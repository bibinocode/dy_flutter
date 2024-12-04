import 'package:flutter/material.dart';

class CommendPage extends StatefulWidget {
  const CommendPage({super.key});

  @override
  _CommendPageState createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('推荐'),
      ),
    );
  }
}
