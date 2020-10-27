import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String headline;
  CustomHeader({@required this.headline});

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(color: Colors.white),
        Center(
          child: Text(
            widget.headline,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
