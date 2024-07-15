import 'package:flutter/cupertino.dart';
import '../constant.dart';

class CalculatorButton extends StatelessWidget {

  CalculatorButton({required this.buttonTitle, required this.onTap});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainer,
        child: Center(child: Text(buttonTitle, style: kMediumFontSize,)),
      ),
    );
  }
}