import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_isync/providers/dragable_provider.dart';

import 'custom_draggable.dart';

class DragDropContainer extends StatelessWidget {
  const DragDropContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      top: 100,
      child: SizedBox(
        width: 300,
        height: 400,
        child: DragTarget<DraggableWidget>(
          onAcceptWithDetails: (details) {
            final data = details.data;
            context.read<DragDropProvider>().addWidget(data);
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              color: candidateData.isNotEmpty
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.grey[300],
            );
          },
        )

      ),
    );
  }
}
