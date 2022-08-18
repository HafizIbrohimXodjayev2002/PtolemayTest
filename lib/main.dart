import 'package:flutter/material.dart';
import 'package:ptolemay/di/injection_container.dart';
import 'package:ptolemay/presentation/app/ptolemay_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const PtolemayApp());
}