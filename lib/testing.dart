import 'package:flutter/material.dart';

class TestingWidget extends StatelessWidget {
  const TestingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 2;
    if(i==3){
      Container();
    }else{
      return SizedBox.shrink();
    }
    i= i+1;
    return SizedBox();
  }
}
