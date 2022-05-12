import 'package:demo/controller/counter_bloc.dart';
import 'package:flutter/material.dart';

class check extends StatefulWidget {
  const check({ Key? key }) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
 final counterBloc =CounterBloc();
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parvej"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),
            StreamBuilder(
              stream: counterBloc.counterStream,
              builder: (context, snapshot){
                return Text(
                  "$counter",
                  style: TextStyle(
                    fontSize:24
                  ),
                );
              },
               
              )
          ],
        ),
      ),
     
    );
  }
}