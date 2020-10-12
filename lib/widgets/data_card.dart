import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  DataCard({@required this.inputColor, this.cardChild, this.handleOnTap});
  final Color inputColor;
  final Widget cardChild;
  final VoidCallback handleOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnTap(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: inputColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
