import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/opens_menu.dart';
import 'custom_draggable.dart';

class BuildDraggableMenuItem extends StatelessWidget {
  const BuildDraggableMenuItem( {super.key , required this.data, required this.feedback,});
  final DraggableWidget data;
  final Widget feedback ;

  @override
  Widget build(BuildContext context) {
    return Draggable<DraggableWidget>(
      data: data,
      feedback: Material(
        color: Colors.transparent,
        child: feedback,
      ),
      childWhenDragging: Container(),
      onDragStarted:
      Provider.of<MenuOpens>(context, listen: false).changeStatus,
      child: feedback,
    );
  }
}

