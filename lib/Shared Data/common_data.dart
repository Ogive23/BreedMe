import 'package:flutter/material.dart';

class CommonData extends ChangeNotifier{
  int step = 2;
  List<int> previousSteps = [2];
  changeStep(int step){
    this.step = step;
    this.previousSteps.add(step);
    print(previousSteps);
    notifyListeners();
  }
  back(){
    previousSteps.removeLast();
    this.step = previousSteps.last;
    print('removed $previousSteps');
    notifyListeners();
  }
  lastStep(){
    return previousSteps.length == 1;
  }
}