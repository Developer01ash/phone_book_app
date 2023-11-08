import 'package:flutter/material.dart';

import 'contact_model.dart';
import 'home.dart';

void main() => runApp(const MyApp());

List<ContactElement> contactList = <ContactElement>[];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
