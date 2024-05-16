import 'package:flutter/material.dart';
import 'package:flutter_new_project/src/presentation/my_app.dart';
import '../../../src/presentation/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(const MyApp());
}
