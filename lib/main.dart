import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:howoldami/misc/locale.dart';
import 'package:howoldami/routes/home/homeView.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // I'd normally use MaterialApp.router with go_router wrapped in a provider here, but as this simple app only has one view...
    return MaterialApp(
      localizationsDelegates: stdLocalizationDelegates,
      supportedLocales: supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
