import 'package:first_app/dice_roller.dart';
// import 'package:first_app/text_widget.dart';
import 'package:flutter/material.dart';

// Creating variables for gradient alignment
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

// Creating variable for active image
// var activeImage = 'assets/images/dice-images/dice-1.png';

// We can also create the variable with the required type.
// but we have to put a ? so dart will know
//the variables are going to be assigned
//dynamically
// Alignment? start;
// Alignment? end;

// If const keyword applied then the variable
// is going to be constat and can't be changed in compile time.
// But if we use final then it does exact same but
// only can be assigned once at runtime.

// void rollDice() {
//   activeImage = 'assets/images/dice-images/dice-4.png';
//   print('image');
// }

// If we have something that will affect the render of
// UI and some internal changes during run time then
// We have to use StatefulWidget

// Creating a separate class for GradientContainer
class GradientContainer extends StatelessWidget {
  final Color darkRegion;
  final Color lightRegion;

  const GradientContainer(this.darkRegion, this.lightRegion, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [darkRegion, lightRegion],
          begin: startAlignment, //variable
          end: endAlignment, //variable
        ),
      ),
      // child: textWidget('roshan'),
      child: Center(

        child: DiceRoller(),

        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   // Since it takes all the avialabe vertical space
        //   // so the image not in center inspite of kept under center
        //   children: [
        //     Image.asset(activeImage, width: 200),
        //     SizedBox(
        //       height: 20,
        //       // child: Text('hello'),
        //     ),
        //     TextButton(
        //       onPressed: rollDice,
        //       style: TextButton.styleFrom(
        //         // padding: EdgeInsets.all(10),
        //         foregroundColor: const Color.fromARGB(255, 228, 229, 233),
        //         textStyle: TextStyle(fontSize: 30),
        //       ),
        //       child: Text('Roll dice'),
        //     ),
        //   ],
        // ),

        // child: Text(
        //   'hello world',
        //   style: TextStyle(color: Colors.white, fontSize: 20),
        // ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: GradientContainer(
          Color.fromARGB(255, 7, 119, 133),
          Color.fromARGB(255, 7, 184, 207),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MyApp(),
    // MaterialApp(
    //   home: Scaffold(
    //     backgroundColor: Colors.cyan,
    //     body: GradientContainer(),
    // body: Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [
    //         const Color.fromARGB(255, 5, 105, 118),
    //         const Color.fromARGB(255, 3, 174, 200),
    //       ],
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //     ),
    //   ),
    //   child: Center(
    //     child: Text(
    //       'hello world',
    //       style: TextStyle(color: Colors.white, fontSize: 20),
    //     ),
    //   ),
    // ),
    // ),
    // ),
  );
}
