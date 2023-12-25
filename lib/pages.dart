import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

enum Pages {
  signin("signin", SigninPage()),
  home("home", HomePage());

  final String routeName;
  final Widget page;
  const Pages(this.routeName, this.page);

  Future<dynamic> pushReplacement(BuildContext context) async {
    return await Navigator.pushReplacementNamed(context, routeName);
  }

  Map<String, Widget Function(BuildContext)> get route =>
      {routeName: (context) => page};
}
