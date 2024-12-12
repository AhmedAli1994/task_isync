import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/slider_provider.dart';
import '../../customs/build_draggable_item.dart';
import '../../customs/custom_draggable.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context);

    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: Container(
        width: 200,
        color: Colors.blue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  BuildDraggableMenuItem(
                    data: DraggableWidget(
                      widget: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Push Button"),
                      ),
                    ),
                    feedback: const ElevatedButton(
                      onPressed: null,
                      child: Text("Push Button"),
                    ),
                  ),
                  BuildDraggableMenuItem(
                    data: DraggableWidget(
                      widget: TextButton(
                        onPressed: () {},
                        child: const Text("Click Button"),
                      ),
                    ),
                    feedback: const TextButton(
                      onPressed: null,
                      child: Text("Click Button"),
                    ),
                  ),
                  BuildDraggableMenuItem(
                    data: DraggableWidget(
                      widget: Slider(
                        value: sliderProvider.sliderValue,
                        onChanged: sliderProvider.updateSliderValue,
                      ),
                    ),
                    feedback: SizedBox(
                      width: 150,
                      child: Slider(
                        value: sliderProvider.sliderValue,
                        onChanged: sliderProvider.updateSliderValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
