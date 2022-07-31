import 'package:flutter/material.dart';
class OrientationWidget extends StatelessWidget {
  const OrientationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                                color: Colors.blue,
                                width: 20
                            )
                        ),
                        constraints: BoxConstraints.expand(),
                        child: Text("A"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        color: Colors.cyan,
                        child: Text("B"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.blue,
                child: Row(),
              ),
            )
          ],
        )
    );
  }
}
