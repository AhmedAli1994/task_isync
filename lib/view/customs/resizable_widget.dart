import 'package:flutter/material.dart';

class ResizableWidget extends StatefulWidget {
  final Widget child;
  final Size initialSize;
  final Function(Size newSize) onResize;

  const ResizableWidget({
    super.key,
    required this.child,
    required this.initialSize,
    required this.onResize,
  });

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    width = widget.initialSize.width;
    height = widget.initialSize.height;
  }

  void _updateSize(DragUpdateDetails details) {
    setState(() {
      width += details.delta.dx;
      height += details.delta.dy;
    });
    widget.onResize(Size(width, height));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: widget.child,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onPanUpdate: _updateSize,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
