import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  int height = 180;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),

      ),
    );
  }
}