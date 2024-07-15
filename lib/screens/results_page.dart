import 'package:bmi_calculator/components/calculator_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constant.dart';


class ResultsPage extends StatelessWidget {
ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

final String bmiResult;
final String resultText;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text("Your Result",style: kLargeFontSize),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(colour: kActiveCardColor,cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(child: Text(resultText.toUpperCase(), style: TextStyle(color: resultText  == "Normal" ? Colors.green : Colors.red, fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold))),
                Center(child: Text(bmiResult, style: kBMITextFontSize,),),
                  Center(child: Text(interpretation, textAlign: TextAlign.center,style: kBodyTextFontSize),)
                ],
              ),
              ),
          ),
          CalculatorButton(buttonTitle: "RE-CALCULATE", onTap: (){Navigator.pop(context);})


        ],
      ),
    );
  }
}
