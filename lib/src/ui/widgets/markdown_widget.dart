import 'package:flutter/material.dart';
import 'package:flutter_highlighter/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:free_gpt/src/src.dart';
import 'package:url_launcher/url_launcher.dart';


class MarkdownWidget extends StatefulWidget {
  const MarkdownWidget({
    super.key,
    required this.text,
    this.animated = false,
    this.duration = const Duration(milliseconds: 1),
  });
  final String text;
  final bool animated;
  final Duration duration;

  @override
  State<MarkdownWidget> createState() => _MarkdownWidgetState();
}

class _MarkdownWidgetState extends State<MarkdownWidget> {
  String _text = "";

  @override
  void initState() {
    super.initState();
    if (widget.animated) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          context.rHome.setAnimate(false);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return !widget.animated
        ? markdown(widget.text)
        : StreamBuilder(
            stream: context.wHome.animate ? typingStream() : null,
            builder: (context, snapshot) {
              return markdown(snapshot.data ?? "●");
            },
          );
  }

  MarkdownBody markdown(String msg) {
    return MarkdownBody(
      selectable: true,
      data: msg,
      shrinkWrap: true,
      builders: <String, MarkdownElementBuilder>{
        'code': CustomCodeBlockBuilder(),
        'img': NonCacheNetworkImage(),
      },
      onTapLink: (String text, String? data, String? more) {
        launchUrl(Uri.parse(data ?? text));
      },
      styleSheet: MarkdownStyleSheet(
        strong: const TextStyle(
          fontWeight: FontWeight.w900,
        ),
        code: TextStyle(
          backgroundColor: Colors.transparent,
          color: context.colorScheme.onSecondaryContainer,
        ),
        codeblockDecoration: BoxDecoration(
          color: vs2015Theme['root']?.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Stream<String> typingStream() async* {
    _text = "";
    for (int code in widget.text.runes) {
      _text += String.fromCharCode(code);
      yield "$_text●";
      if (![32, 10].contains(code)) {
        await Future.delayed(widget.duration);
      }
    }
    yield _text;
    context.rHome.setAnimate(false);
    context.rHome.setIsLoading(false);
  }
}
