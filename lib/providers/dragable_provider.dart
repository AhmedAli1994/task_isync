import 'package:flutter/material.dart';
import '../view/customs/custom_draggable.dart';


class DragDropProvider with ChangeNotifier {
  final List<DraggableWidget> _widgets = [];

  List<DraggableWidget> get widgets => _widgets;

  void addWidget(DraggableWidget widget) {
    _widgets.add(widget);
    notifyListeners();
  }

  void updateWidget(int index, Offset position, Size size) {
    _widgets[index] = DraggableWidget(
      widget: _widgets[index].widget,
      position: position,
      size: size,
    );
    notifyListeners();
  }
}