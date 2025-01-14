import 'package:flutter/material.dart';
import '../constants/style.dart';

class FlashcardWidget extends StatelessWidget {
  const FlashcardWidget(
      {Key? key,
      required this.flashcardTitle,
      required this.indexAction,
      required this.totalFlashcards})
      : super(key: key);

  final String flashcardTitle;
  final int indexAction;
  final int totalFlashcards;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
            'Flashcard ${indexAction + 1}/$totalFlashcards: $flashcardTitle',
            style: const TextStyle(
              fontSize: 24.0,
              color: deepOrange,
            ),
            ));
  }
}
