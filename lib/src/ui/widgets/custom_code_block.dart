import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:free_gpt/src/src.dart';
import 'package:markdown/markdown.dart' as md;

class CustomCodeBlockBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final int length = element.textContent.split("\n").length;
    String language = "dart";

    if (element.attributes["class"] != null) {
      language = element.attributes["class"]!.split("-").last;
    } else if (length == 1) {
      return Material(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          onTap: () => copy(context, element.textContent),
          borderRadius: BorderRadius.circular(3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
            child: Text(
              element.textContent,
              style: preferredStyle,
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: context.colorScheme.primaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.attributes["class"]?.split("-").last ?? "text"),
              TextButton(
                onPressed: () => copy(context, element.textContent),
                child: const Text("Copy"),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HighlightView(
            element.textContent,
            language: language,
            theme: vs2015Theme,
            tabSize: 2,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          ),
        ),
      ],
    );
  }

  Future<void> copy(BuildContext context, String text) async {
    await Clipboard.setData(
      ClipboardData(text: text),
    ).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colorScheme.secondaryContainer,
          duration: const Duration(milliseconds: 400),
          content: Text(
            'Copied to clipboard',
            style: TextStyle(color: context.colorScheme.onSecondaryContainer),
          ),
        ),
      );
    });
  }
}
