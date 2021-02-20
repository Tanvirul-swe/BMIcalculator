import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPresssed});

  final IconData icon;
  final Function onPresssed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPresssed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width:50.0,
        height: 50.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}