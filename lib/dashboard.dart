import 'package:billionaire_app/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalAmount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBalance();
  }

  void increment() async{
    totalAmount +=500;
    setState(() {
      totalAmount;
    });

    //obtaining sharedPreferences instance
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    /// saving the int data to the key totalAmount
    await preferences.setInt('totalAmount', totalAmount);
    print(totalAmount);
  }

  void decrement() async{
    if(totalAmount >0){
      totalAmount -= 500;
    }
    setState(() {
      totalAmount;
    });

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('totalAmount', totalAmount);
  }

  void loadBalance() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      totalAmount = preferences.getInt('totalAmount') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Billionaire App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Bank Balance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text('\$${NumberFormat.simpleCurrency(name: '').format(totalAmount)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),

              ///----buttons from the child class----
              Buttons(increment: increment, decrement: decrement)
            ],
          ),
        ),
    );
  }
}
