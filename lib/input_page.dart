import 'package:bmicalculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'reusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCardValue.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'button.dart';
import 'calculator_brain.dart';
import 'result_page.dart';


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender gender;
   int height=180;
   int weight = 50;
   int age=18;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                 onTap: (){
                  setState(() {
                    gender = Gender.male;
                  });
                 },
                  child: ReusableCard(
                    colour: gender == Gender.male ? activeCardColour : inactiveCardColour,//That is ternary operation that's like  if statement.
                    cardChild: ReusableCardValue(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(child: ReusableCard(
                colour: gender==Gender.female ? activeCardColour : inactiveCardColour,//That is ternary operation that's like  if statement.
                cardChild: GestureDetector(
                  onTap: (){
                    setState(() {
                     gender = Gender.female;
                    });
                  },
                  child: ReusableCardValue(
                     icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(
            colour: Color(0xFF1D1E33),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: labelTextStyle2,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,

                    ),
                  ],
                ),
                SliderTheme(             //custom slider theme
                  data: SliderTheme.of(context).copyWith(
                    activeTickMarkColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 60.0,
                    max: 250.0,
                    activeColor: Colors.red,
                    inactiveColor: Colors.white,
                    onChanged: (double newValue)
                      {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(

            children: [
              Expanded(child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: klabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: labelTextStyle2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                            onPresssed: (){
                            setState(() {
                              weight--;
                            });
                            },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                       RoundIconButton(
                         icon: FontAwesomeIcons.plus,
                         onPresssed: (){
                           setState(() {
                             weight++;
                           });
                         },
                       ),
                      ],
                    ),
                  ],

                ),

              ),
              ),
              Expanded(child: Row(
               children: [
                 Expanded(child: ReusableCard(
                   colour: activeCardColour,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         'AGE',
                         style: klabelTextStyle,
                       ),
                       Text(
                         age.toString(),
                         style: labelTextStyle2,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPresssed:()
                               {
                                 setState(() {
                                   age--;
                                 });
                               }
                           ),
                           SizedBox(
                             width: 10.0,
                           ),
                           RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPresssed:()
                               {
                                 setState(() {
                                   age++;
                                 });
                               }
                           ),
                         ],
                       ),
                     ],
                   ),

                 ),
                 ),
               ],
              ),
              ),
            ],
          ),
          ),
           Button(
             buttonTitle: 'Calculate',
             onTap: (){
               CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

             Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(
               bmiResult: calc.calculateBMI(),
               resultText: calc.getResult(),
               interpretation: calc.getInterpretation(),
             ),
             ),
             );
             },

           ),
        ],
      ),
    );
  }
}










