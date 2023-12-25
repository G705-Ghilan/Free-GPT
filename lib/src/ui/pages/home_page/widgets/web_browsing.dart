import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class WebBrowsing extends StatelessWidget {
  const WebBrowsing({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.wHome.webReading) {
      return Padding(
        padding: KTheme.padding,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: KTheme.borderRadius,
            side: BorderSide(color: context.colorScheme.outlineVariant),
          ),
          dense: true,
          leading: const CircleAvatar(child: Icon(Icons.search_outlined)),
          title: const Text("Web browsing"),
          subtitle: const GPTTextAnimation(
            texts: ["Reading ...", "Browsing ...", "Generating ..."],
            looping: true,
            endingTime: Duration.zero,
          ),
          // tileColor: context.colorScheme.secondaryContainer,
        ),
      );
    }
    return const SizedBox();
  }
}
