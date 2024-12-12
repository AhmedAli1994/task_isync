import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_isync/providers/list_providers.dart';
import 'package:task_isync/view/screens/dragable_drop_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'I Sync Drag',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DragDropPage(),
      ),
    );
  }
}
