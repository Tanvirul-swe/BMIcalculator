import 'package:flutter/material.dart';
import 'result_page.dart';

class Button extends StatelessWidget {

  Button ({@required this.onTap,@required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Result()),     //One screen to another screen.
        );
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}