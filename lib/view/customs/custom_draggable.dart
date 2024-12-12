import 'package:flutter/material.dart';

class DraggableWidget {
  Widget widget;
  Offset position;
  Size size;

  DraggableWidget({
    required this.widget,
    this.position = const Offset(100, 100),
    this.size = const Size(100, 50),
  });
}


