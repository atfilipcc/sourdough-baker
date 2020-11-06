import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_header.dart';
import '../widgets/baking_list_builder.dart';

class SpeedbakeScreen extends StatefulWidget {
  static final id = 'speedbake_screen';
  @override
  _SpeedbakeScreenState createState() => _SpeedbakeScreenState();
}

class _SpeedbakeScreenState extends State<SpeedbakeScreen> {
  String name = 'The Speedbake';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(top: 20.0, left: 0, right: 30.0, bottom: 10.0),
            child: CustomHeader(headline: name),
          ),
          Expanded(
            child: Container(
              child: BakingListBuilder(name),
              decoration: BoxDecoration(
                color: kDarkShade,
                borderRadius: kBorderRadiusRoundedTop,
              ),
            ),
          )
        ],
      ),
    );
  }
}
