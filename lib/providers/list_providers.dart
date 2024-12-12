import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task_isync/providers/slider_provider.dart';
import 'dragable_provider.dart';
import 'opens_menu.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => DragDropProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => MenuOpens(),
  ),
  ChangeNotifierProvider(
    create: (context) => SliderProvider(),
  ),
];
