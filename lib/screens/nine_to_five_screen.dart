import 'package:flutter/material.dart';
import '../widgets/baking_list_builder.dart';
import '../utils/constants.dart';
import '../widgets/custom_header.dart';

class NineToFiveScreen extends StatefulWidget {
  static final id = 'nine_to_five_baker_screen';
  @override
  _NineToFiveScreenState createState() => _NineToFiveScreenState();
}

class _NineToFiveScreenState extends State<NineToFiveScreen> {
  String name = 'The 9-5 Bake';

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
