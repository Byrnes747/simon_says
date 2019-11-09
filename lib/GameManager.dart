import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'command.dart';

class GameManager with ChangeNotifier {

  List<Command> _commands = [Command.random(), Command.random(), Command.random()]; //Growable List
  int _points = 0;
  int _iterator = 0;
  String _instruction = 'Click "Start" to begin.';
  int _timer = 0;
  bool _stopTimer = false; //Flag used to pause timer.
  bool _canPlay = false; //Flag used to determine if the player should be able to play at a given time.

  int get timer => _timer;

  updateTimer(int value) {
    _timer = value;
    notifyListeners();
  }

  String get instruction => _instruction;

  updateInstruction(String value) {
    _instruction = value;
    notifyListeners();
  }

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

  void gameStart() async{
    _canPlay = false;
    _stopTimer = true;
    _points = 0;
    _iterator = 0;
    _commands.clear();
    for(int i = 0; i<3; i++) {
      _commands.add(Command.random());
    }
    for(int i = 0; i<_commands.length; i++) {
      updateInstruction(_commands[i].toString() + ' [${i+1}/${_commands.length}]');
      print(_instruction);
      await Future.delayed(const Duration(seconds: 2), (){});
    }
    updateInstruction('Go! ${_iterator+1}/${_commands.length}');
    _stopTimer = false;
    startTimer();
    _canPlay = true;
  }

  void printCommands() {
    for(int i = 0; i < _commands.length; i++) {
      print(_commands[i].toString());
    }
  }

  void startTimer() async{
    updateTimer(60);
    while(!_stopTimer && _timer>0) {
      //print('Decrementing time...');
      await Future.delayed(const Duration(seconds: 1), (){});
      updateTimer(_timer-1);
    }
  }

  void processInput(String color, String inputType) {
    //print('Processing input...');
    //print('    Color: ' + color);
    //print('    InputType: ' + inputType);

    if(_canPlay){

      if(inputType=='click' && _commands[_iterator].act == action.click) {
        if(_commands[_iterator].simonSays && _commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
        else if(!_commands[_iterator].simonSays && !_commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
      }
      else if(inputType=='swipe' && _commands[_iterator].act == action.swipe) {
        if(_commands[_iterator].simonSays && _commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
        else if(!_commands[_iterator].simonSays && !_commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
      }
      else if(_commands[_iterator].act == action.not) {
        if(_commands[_iterator].simonSays && !_commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
        else if(!_commands[_iterator].simonSays && _commands[_iterator].toString().contains(color)) {
          _iterator++;
          updateInstruction('Go! ${_iterator+1}/${_commands.length}');
        }
      }

    }

  }

}