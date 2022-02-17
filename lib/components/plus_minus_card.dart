import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class PlusMinusCard extends StatefulWidget {
  const PlusMinusCard(
      {Key? key,
      required this.label,
      this.initValue = 0,
      required this.callback})
      : super(key: key);

  final int initValue;
  final String label;
  final IntCallback callback;

  @override
  _PlusMinusCardState createState() => _PlusMinusCardState();
}

class _PlusMinusCardState extends State<PlusMinusCard> {
  int value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: () {
                setState(() {
                  value--;
                  widget.callback(value);
                });
              },
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              onPressed: () {
                setState(() {
                  value++;
                  widget.callback(value);
                });
              },
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}

typedef void IntCallback(int val);
