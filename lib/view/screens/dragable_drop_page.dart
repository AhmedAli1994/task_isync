import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_isync/providers/dragable_provider.dart';
import 'package:task_isync/view/customs/drag_drop_container.dart';
import 'package:task_isync/view/customs/my_app_bar.dart';
import 'package:task_isync/view/screens/widgets/side_menu.dart';
import '../../providers/opens_menu.dart';
import '../customs/resizable_widget.dart';

class DragDropPage extends StatelessWidget {
  const DragDropPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuOpens = Provider.of<MenuOpens>(context).isMenuOpen;
    return Scaffold(
      appBar: const MyAppBar(),
      body: Consumer<DragDropProvider>(
        builder: (context, provider, _) {
          return Stack(
            children: [
              const DragDropContainer(),
              ...List.generate(provider.widgets.length, (index) {
                final draggableWidget = provider.widgets[index];
                return Positioned(
                  left: draggableWidget.position.dx,
                  top: draggableWidget.position.dy,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      const containerSize = Size(300, 400);
                      const containerOffset = Offset(50, 100);

                      final newPosition = Offset(
                        draggableWidget.position.dx + details.delta.dx,
                        draggableWidget.position.dy + details.delta.dy,
                      );

                      final constrainedPosition = Offset(
                        newPosition.dx.clamp(
                            containerOffset.dx,
                            containerOffset.dx +
                                containerSize.width -
                                draggableWidget.size.width),
                        newPosition.dy.clamp(
                            containerOffset.dy,
                            containerOffset.dy +
                                containerSize.height -
                                draggableWidget.size.height),
                      );

                      if (_isInsideDropArea(constrainedPosition)) {
                        provider.updateWidget(
                            index, constrainedPosition, draggableWidget.size);
                      }
                    },
                    child: ResizableWidget(
                      initialSize: draggableWidget.size,
                      onResize: (size) {
                        provider.updateWidget(
                            index, draggableWidget.position, size);
                      },
                      child: draggableWidget.widget,
                    ),
                  ),
                );
              }),
              if (menuOpens) const SideMenu(),
            ],
          );
        },
      ),
    );
  }

  bool _isInsideDropArea(Offset position) {
    const double left = 50;
    const double top = 100;
    const double right = left + 300;
    const double bottom = top + 400;

    return position.dx >= left &&
        position.dx <= right &&
        position.dy >= top &&
        position.dy <= bottom;
  }
}
