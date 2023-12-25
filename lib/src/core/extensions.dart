import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'package:provider/provider.dart';

extension BuildContextPlus on BuildContext {
  // providers
  SigninProvider get rSignin => read<SigninProvider>();
  SigninProvider get wSignin => watch<SigninProvider>();
  HomePageProvider get rHome => read<HomePageProvider>();
  HomePageProvider get wHome => watch<HomePageProvider>();

  // theme
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
