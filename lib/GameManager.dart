import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'command.dart';

class GameManager with ChangeNotifier {

  List<Command> _commands; //Growable List
  int _points = 0;
  int _iterator = 0;

  int get points => _points;

  set points(int value) {
    _points = value;
    notifyListeners();
  }

  int get iterator => _iterator;

  set iterator(int value) {
    _iterator = value;
    notifyListeners();
  }

  GameManager() {
    _points = 0;
    _iterator = 0;
    for(int i = 0; i<3; i++) {
      _commands.add(Command.random());
    }
    notifyListeners();
  }

  void restart() {
    _points = 0;
    _iterator = 0;
    _commands.clear();
    for(int i = 0; i<3; i++) {
      _commands.add(Command.random());
    }
    notifyListeners();
  }

}