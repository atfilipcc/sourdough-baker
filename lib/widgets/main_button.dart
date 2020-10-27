import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {@required this.title,
      @required this.inputColour,
      @required this.onPressed});

  final Color inputColour;
  final String title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: inputColour,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          height: 42.0,
          minWidth: 200.0,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
