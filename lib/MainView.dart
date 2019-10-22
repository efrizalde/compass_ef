import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_compass/flutter_compass.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  StreamSubscription compass;
  double _direction = 0;

  @override
  void initState() {
    if (mounted) {
      initCompass();
    }
    super.initState();
  }

  initCompass() {
    compass = FlutterCompass.events.listen((double direction) {
      if (mounted) {
        setState(() {
          _direction = direction;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contoh Kompas Flutter"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Transform.rotate(
            child: Image.asset('assets/compass.png'),
            angle: ((_direction.abs() ?? 0) * (math.pi / 180) * -1),
          ),
        ),
      ),
    );
  }
}
