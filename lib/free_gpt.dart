import 'package:flutter/material.dart';
import 'package:free_gpt/pages.dart';
import 'package:free_gpt/src/src.dart';

class FreeGPTApp extends StatelessWidget {
  const FreeGPTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: context.wHome.themeMode,
      home: AuthOptions.isSignedIn ? Pages.home.page : Pages.signin.page,
      routes: {for (Pages page in Pages.values) ...page.route},
    );
  }
}
