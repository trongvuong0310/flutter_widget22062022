import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> {
  TextEditingController textControllerNumber1 = TextEditingController();
  TextEditingController textControllerNumber2 = TextEditingController();
  var result;

  /**
   * Event Click Button Plus
   */
  void onPressButtonPlus() {
    var textNumber1 = textControllerNumber1.text;
    var textNumber2 = textControllerNumber2.text;
    setState(() {
      if (textNumber1.isEmpty || textNumber2.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data empty")));
        result = null;
        return;
      }
      setState(() {
        result = int.parse(textNumber1) + int.parse(textNumber2);
      });
    });
  }

  /**
   * Event Click Button Minute
   */
  void onPressButtonMinute() {
    var textNumber1 = textControllerNumber1.text;
    var textNumber2 = textControllerNumber2.text;
    setState(() {
      if (textNumber1.isEmpty || textNumber2.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data empty")));
        result = null;
        return;
      }
      setState(() {
        result = int.parse(textNumber1) - int.parse(textNumber2);
      });
    });
  }

  /**
   * Event Click Button Multiplication
   */
  void onPressButtonMultiplication() {
    var textNumber1 = textControllerNumber1.text;
    var textNumber2 = textControllerNumber2.text;
    setState(() {
      if (textNumber1.isEmpty || textNumber2.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data empty")));
        result = null;
        return;
      }
      setState(() {
        result = int.parse(textNumber1) * int.parse(textNumber2);
      });
    });
  }

  /**
   * Event Click Button Divide
   */
  void onPressButtonDivide() {
    var textNumber1 = textControllerNumber1.text;
    var textNumber2 = textControllerNumber2.text;
    setState(() {
      if (textNumber1.isEmpty || textNumber2.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data empty")));
        result = null;
        return;
      }
      if (int.parse(textNumber2) == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Number 2 not 0")));
        result = null;
        return;
      }
      setState(() {
        result = int.parse(textNumber1) / int.parse(textNumber2);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lifecycle Widget"),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 2,
                    child: const Center(
                      child: const Text("Máy tính bỏ túi",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 30
                          )),
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            createTextFieldWidget(hintText: "Input number 1", controller: textControllerNumber1),
                            createTextFieldWidget(hintText: "Input number 2", controller: textControllerNumber2),
                          ],
                        ),
                      )
                  ),
                  Flexible(
                      flex: 1,
                      child: Visibility(
                        visible: result != null,
                        child: Center(
                            child: Text("Result = $result", style: TextStyle(color: Colors.red, fontSize: 20))
                        ),
                      )
                  ),
                  Flexible(
                      flex: 4,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            createRowButton(
                                buttonName1: "+",
                                buttonName2: "-",
                                onPressButton1: onPressButtonPlus,
                                onPressButton2: onPressButtonMinute
                            ),
                            SizedBox(height: 20),
                            createRowButton(
                                buttonName1: "*",
                                buttonName2: "/",
                                onPressButton1: onPressButtonMultiplication,
                                onPressButton2: onPressButtonDivide
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Row button
   *
   * @param String buttonName1
   * @param String buttonName2
   * @param Function()? onPressButton1
   * @param Function()? onPressButton2
   */

  Widget createRowButton({
    String buttonName1 = "",
    String buttonName2 = "",
    Function()? onPressButton1,
    Function()? onPressButton2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: onPressButton1, child: Text(buttonName1, style: TextStyle(fontSize: 25, fontFamily: "Roboto"))),
        ElevatedButton(onPressed: onPressButton2, child: Text(buttonName2, style: TextStyle(fontSize: 25, fontFamily: "Roboto"))),
      ],
    );
  }

  /**
   * Render TextField
   *
   * @param String? hintText
   * @param Icon? preFixIcon
   * @param TextEditingController? controller
   *
   * @return Widget
   */
  Widget createTextFieldWidget({
    String? hintText,
    Icon? preFixIcon,
    TextEditingController? controller
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 5,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: preFixIcon,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.grey)
          ),
        ),
      ),
    );
  }
}
