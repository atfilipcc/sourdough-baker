import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'package:provider/provider.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
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
        TextButton(
          child: Text('Reset',
              style: TextStyle(fontSize: 16.0, color: Colors.white)),
          onPressed: () => Provider.of<RecipeModel>(context, listen: false)
              .resetList(widget.headline),
        )
      ],
    );
  }
}
