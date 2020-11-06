import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_header.dart';
import '../widgets/baking_list_builder.dart';

class NightBakerScreen extends StatefulWidget {
  static final id = 'night_baker_screen';
  @override
  _NightBakerScreenState createState() => _NightBakerScreenState();
}

class _NightBakerScreenState extends State<NightBakerScreen> {
  String name = 'The Night Bake';

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
