import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class GPTTextAnimation extends StatefulWidget {
  const GPTTextAnimation({
    super.key,
    required this.texts,
    this.looping = false,
    this.style,
    this.seperateTime = const Duration(milliseconds: 500),
    this.betweentime = const Duration(milliseconds: 50),
    this.endingTime = const Duration(seconds: 1),
    this.isOneside = false,
    this.onStartDeleting,
    this.hideOnEnd = false,
  });

  final List<String> texts;
  final bool looping;
  final bool isOneside;
  final TextStyle? style;
  final Duration seperateTime;
  final Duration betweentime;
  final Duration endingTime;
  final bool hideOnEnd;
  final void Function(int milliseconds)? onStartDeleting;

  @override
  State<GPTTextAnimation> createState() => _GPTTextAnimationState();
}

class _GPTTextAnimationState extends State<GPTTextAnimation> {
  late Stream<String> stream;
  bool visibleCircle = true;
  List<String> texts = [];

  @override
  void initState() {
    super.initState();
    stream = widget.looping ? loopingTypingStream() : typingStream();
    texts = widget.texts;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = widget.style ?? DefaultTextStyle.of(context).style;
    if (texts.first != widget.texts.first) {
      visibleCircle = true;
      stream = widget.looping ? loopingTypingStream() : typingStream();
      texts = widget.texts;
    }
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: _style,
              text: snapshot.data,
              children: [
                if (visibleCircle)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      height: _style.fontSize,
                      width: _style.fontSize,
                      decoration: BoxDecoration(
                        color: _style.color ??
                            context.colorScheme.onSecondaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
              ],
            ),
          );
        });
  }

  Stream<String> typingStream() async* {
    String text = "";
    yield text;
    for (String line in widget.texts) {
      text = "";
      await Future.delayed(widget.seperateTime);
      for (int code in line.runes) {
        await Future.delayed(widget.betweentime);
        text += String.fromCharCode(code);
        yield text;
      }

      if (widget.isOneside) break;
      await Future.delayed(widget.seperateTime);

      if (widget.onStartDeleting != null) {
        widget.onStartDeleting!(
          widget.betweentime.inMilliseconds * text.length,
        );
      }

      for (int i = text.length - 1; i >= 0; i--) {
        await Future.delayed(widget.betweentime);
        yield text.substring(0, i);
      }
    }
    if (widget.hideOnEnd) {
      setState(() {
        visibleCircle = false;
      });
    }
  }

  Stream<String> loopingTypingStream() async* {
    while (true) {
      await for (String text in typingStream()) {
        yield text;
      }
      await Future.delayed(widget.endingTime);
    }
  }
}
