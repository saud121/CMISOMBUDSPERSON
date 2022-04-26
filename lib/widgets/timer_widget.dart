
import 'dart:async';

import 'package:flutter/cupertino.dart';
class TimeController extends ValueNotifier<bool>{
  TimeController({bool isPlaying = false}) : super(isPlaying);
  void startTimer() => value = true;
  void stopTimer() => value = false;
}

class TimerWidget extends StatefulWidget {
 final TimeController controller;
  const TimerWidget({Key key,this.controller}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration =Duration();
  Timer timer;
  @override
  void initState(){
    super.initState();
    widget.controller.addListener(() {
      if(widget.controller.value){
        startTimer();
      }
      else{
        stopTimer();
      }
    });
  }
  void reset() => setState(() {
    duration=Duration();
  });
  void addTime(){
    final addSeconds=1;
    setState(() {
      final seconds= duration.inSeconds + addSeconds;
      if(seconds<0){
        timer.cancel();
      }
      else{
        duration=Duration(seconds: seconds);
      }
    });
  }
  void startTimer({bool resets=true}){
      if(!this.mounted) return;
      if(resets){
        reset();}
      timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }
  void stopTimer({bool resets=true}){
      if(! this.mounted) return;
      if(resets){
        reset();}
      setState(() {
        timer.cancel();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
