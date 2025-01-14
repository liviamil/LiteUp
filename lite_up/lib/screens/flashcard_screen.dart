import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/style.dart';
import '../constants/text.dart';
import '../models/flashcard_model.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/next_button.dart';

/* 
FlashcardScreen widget is stateful because it is our parent widget and therefore
all the functions and variables will be in this widget. As a consequence, we
will need to change the state of our widget.
*/
class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({Key? key}) : super(key: key);

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [
    Flashcard(title: flashcards_1[0][0], content: flashcards_1[0][1]),
    Flashcard(title: flashcards_1[1][0], content: flashcards_1[1][1])
  ];

  // Create an index to loop through flashcards
  int index = 0;

  // Create a function to display the next flashcard
  void nextFlashcard() {
    if (index == flashcards.length - 1) {
      return;
    } else {
      setState(() {
        // Increments the index to rebuild the app to show next flashcard
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color
      backgroundColor: background,

      // Set the top app bar
      appBar: AppBar(
          title: Text('Level 1 Flash Cards',
              style: GoogleFonts.poppins(textStyle: appBarTitle)),
          backgroundColor: white,
          elevation: 0),

      // Set the body of the app
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Add the flashcard widget
              FlashcardWidget(
                indexAction: index,
                flashcardTitle: flashcards[index].title,
                totalFlashcards: flashcards.length,
              ),
              const Divider(color: deepOrange),
              // Add some space
              const SizedBox(height: 25),
            ],
          )),

      // Next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: NextButton(nextFlashcard: nextFlashcard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
