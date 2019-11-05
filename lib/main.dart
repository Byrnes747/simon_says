import 'package:flutter/material.dart';
import 'package:simon_says/GameManager.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MaterialApp(title: 'Simon Says', home: SimonSays()));

}

class SimonSays extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GameManager gm = Provider.of<GameManager>(context);

    AppBar appbar = AppBar(title: Text("Simon Says"));
    //TODO: Create Scaffold with following layout:
    // Appbar
    // Column(
    // Row (Display points, display high score, display timer)
    // Display instructions, or what insruction they are on out of the length the list
    // Start/Restart Button
    // Row(Red btn, blue btn)
    // Row(Green btn, yellow btn)
    // )






    Scaffold scaffold = Scaffold();

    return scaffold;
  }
}
