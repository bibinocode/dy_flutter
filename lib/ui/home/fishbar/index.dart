import 'package:flutter/material.dart';

class FishBarPage extends StatefulWidget {
  const FishBarPage({super.key});

  @override
  _FishBarPageState createState() => _FishBarPageState();
}

class _FishBarPageState extends State<FishBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('鱼吧'),
      ),
    );
  }
}
