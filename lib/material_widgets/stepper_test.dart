import "package:flutter/material.dart";

class StepperTest extends StatefulWidget {
  const StepperTest({Key? key}) : super(key: key);

  @override
  State<StepperTest> createState() => _StepperTestState();
}

class _StepperTestState extends State<StepperTest> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stepper(
          currentStep: index,
          onStepCancel: () {
           if(index>0){
             setState(() {
              index -= 1;
            });
           }
          },
          onStepContinue: (){
            if(index<=0){
              setState(() {
                index += 1;
              });
            }
          },
          onStepTapped: (value){
            setState(() {
              index = value;
            });
          },
          steps: const [
            Step(
              title: Text("Step 1"),
              content: Text("Step 1's Content"),
            ),
            Step(
              title: Text("Step 2"),
              content: Text("Step 2's Content"),
            ),
             Step(
              title: Text("Step 3"),
              content: Text("Step 3's Content"),
            ),
          ],
        ),
      ),
    );
  }
}
