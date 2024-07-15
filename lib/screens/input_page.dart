import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_action_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/calculator_button.dart';
import '../constant.dart';
import '../components/icon_content.dart';

enum genderType {
  male,
  female
}


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  genderType? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;
  //late double result;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = genderType.male;
                  });
                },
                  colour: selectedGender == genderType.male ? kActiveCardColor : kInActiveCardColor,
                cardChild: IconContent(icon: Icons.male, label: "MALE"),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = genderType.female;
                  });
                },
                colour: selectedGender == genderType.female ? kActiveCardColor : kInActiveCardColor,
                cardChild: IconContent(icon: Icons.female, label: "FEMALE"),
                )),
            ],
          )),
          Expanded(child: ReusableCard(colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT", style: kLabelTextStyle,),
                Text(height.toString(), style: kLargeFontSize,),
                Slider(value: height.toDouble(), min: 180, max: 220, onChanged:(double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                }),
              ],
            ),
            )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(colour: kActiveCardColor, cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("WEIGHT", style: kLabelTextStyle,),
                  Text(weight.toString(), style: kLargeFontSize,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundActionButton(icon: FontAwesomeIcons.minus, onPress: (){
                        setState(() {
                          weight--;
                        });
                      }),
                      SizedBox(width: 10.0,),
                      RoundActionButton(icon: FontAwesomeIcons.plus, onPress: (){
                        setState(() {
                          weight++;
                        });
                      },),
                    ],
                  ),
                ],
              ),
                )),
              Expanded(child: ReusableCard(colour: kActiveCardColor, cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("AGE", style: kLabelTextStyle,),
                  Text(age.toString(), style: kLargeFontSize,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundActionButton(icon: FontAwesomeIcons.minus, onPress: (){
                        setState(() {
                          age--;
                        });
                      }),
                      SizedBox(width: 10.0,),
                      RoundActionButton(icon: FontAwesomeIcons.plus, onPress: (){
                        setState(() {
                          age++;
                        });
                      },),
                    ],
                  ),
                ],
              ),
               )),
            ],
          ),
          ),
          CalculatorButton(buttonTitle: "CALCULATE",onTap: (){
            CalculatorBrain calc = new CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),);
            }));
          },)
        ],
      )
    );
  }
}









