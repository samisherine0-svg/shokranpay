
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(

      padding: const EdgeInsets.all(5),
      child: Center(
        child: Container(
          child: const CircularProgressIndicator(),
          height: 60.0,
          width: 60.0,
          padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
