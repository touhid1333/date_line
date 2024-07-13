import 'package:flutter/material.dart';

class TimeLineView extends StatefulWidget {
  const TimeLineView({super.key});

  @override
  State<TimeLineView> createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView> {

  @override
  void initState() {
    debugPrint("-------------------- Called : TimeLine -----------------------------");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.time_to_leave),
      ],
    );
  }
}
