import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  void Function() increment ;
  void Function() decrement;
  Buttons({super.key, required this.increment, required this.decrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //button for add money
        Container(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: increment,
            child: Text('Add Money', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[600],
            ),
          ),

        ),
        SizedBox(height: 10,),
        //button for deduct money
        Container(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: decrement,
            child: Text('Deduct Money', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
            ),
          ),
        )
      ],
    );
  }
}
