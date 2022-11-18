import 'package:flutter/material.dart';

import 'counter_notifer.dart';

class Counter extends StatelessWidget {
  Counter({Key? key}) : super(key: key);
  ContNotifer contNotifer = ContNotifer();
  int countertest = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(valueListenable: contNotifer.initialNumber, builder: (context , value , child){
            return Text(
              '${value}',
              style: TextStyle(fontSize: 40),
            );
          }),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    contNotifer.increase();
                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    contNotifer.decrease();
                  },
                  child: Text(
                    '-',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
