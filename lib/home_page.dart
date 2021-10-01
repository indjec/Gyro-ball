import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OverlayEntry? entry;
  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());
    gyroscopeEvents.listen((GyroscopeEvent event) {
      x += event.x * 100;
      y += event.y * 100;
      entry!.markNeedsBuild();
    });
  }

  void showOverlay() {
    entry = OverlayEntry(builder: (context) {
      return Positioned(
        top: x,
        left: y,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      );
    });

    final overlay = Overlay.of(context);
    overlay!.insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
