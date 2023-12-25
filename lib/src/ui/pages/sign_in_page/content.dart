import 'package:flutter/material.dart';
import 'package:free_gpt/pages.dart';
import 'package:free_gpt/src/src.dart';

class SigininContent extends StatelessWidget {
  const SigininContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              duration: context.wSignin.duration,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: context.wSignin.colors(context).text,
              ),
              child: GPTTextAnimation(
                looping: true,
                onStartDeleting: (int milliseconds) {
                  context.rSignin.setDuration(milliseconds);
                  context.rSignin.updateColors(context);
                },
                texts: const [
                  "Let's Go",
                  "ChatGPT",
                  "Let’s explore",
                  "Let’s collaborate",
                  "Let’s invent",
                  "ChatGPT",
                  "Let’s Design",
                  "Let’s chit-chat",
                  "Let’s discover",
                  "ChatGPT",
                  "Let’s create",
                  "Let’s brainstorm",
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: KTheme.padding,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.vertical(
              top: KTheme.borderRadius.topLeft,
            ),
          ),
          child: Column(
            children: [
              FilledButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: KTheme.borderRadius * 0.5,
                    ),
                  ),
                  padding: MaterialStatePropertyAll(KTheme.padding),
                ),
                onPressed: () async => await signin(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/google.png",
                      width: 24,
                      height: 24,
                      color: context.colorScheme.surface,
                    ),
                    const SizedBox(width: 10),
                    const Text("Continue with Google"),
                    const SizedBox(width: 34),
                  ],
                ),
              ),
              const Divider(),
              const Text("Welcome to FreeGPT an application Powered by GPT-3"),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> signin(BuildContext context) async {
    await AuthOptions.withGoogle().then(
      (status) {
        if (status) {
          Pages.home.pushReplacement(context);
        }
      },
    );
  }
}
