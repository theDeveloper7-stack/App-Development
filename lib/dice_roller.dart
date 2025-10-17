import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// The underscore represents that it's private
// even if the class is used or extend by other files.
class _DiceRollerState extends State<DiceRoller> {
  var activeImage = 'assets/images/dice-images/dice-1.png';

  void rollDice() {
    // Since the build method is executed when the
    // rollDice() method is called, but all our UI is
    // Updated inside the runApp() so
    // we have to find a way to execute build method again
    // inside runApp() method.

    var num = Random().nextInt(6) + 1;
    // This method will generate random number
    // between 0 < number < 7
    setState(() {
      activeImage = 'assets/images/dice-images/dice-$num.png';
    });

    // Tells flutter to execute the build method again
    // and update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // Since it takes all the avialabe vertical space
      // so the image not in center inspite of kept under center
      children: [
        Image.asset(activeImage, width: 200),
        SizedBox(
          height: 20,
          // child: Text('hello'),
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: EdgeInsets.all(10),
            foregroundColor: const Color.fromARGB(255, 228, 229, 233),
            textStyle: TextStyle(fontSize: 30),
          ),
          child: Text('Roll dice'),
        ),
      ],
    );
  }
}
