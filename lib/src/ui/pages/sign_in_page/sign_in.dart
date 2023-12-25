import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';
import 'package:free_gpt/src/ui/pages/sign_in_page/content.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Builder(builder: (context) {
        return SystemAreas(
          systemNavigationBarColor: context.colorScheme.primaryContainer,
          child: Scaffold(
            body: AnimatedContainer(
              duration: context.wSignin.duration,
              color: context.wSignin.colors(context).background,
              child: const SigininContent(),
            ),
          ),
        );
      }),
    );
  }
}
