import 'dart:developer';

import 'package:demo/check.dart';
import 'package:demo/controller/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counterBloc =CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parvej"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>check()));
        }, icon: Icon(Icons.arrow_forward_ios))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot){
                return Text(
                  "${snapshot.data}",
                  style: TextStyle(
                    fontSize:24
                  ),
                );
              },
               
              )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed:(){

              counterBloc.eventSink.add(CounterAction.Increment);
            },
            tooltip: "Increment",
            child: Icon(Icons.add), 
          ),
            FloatingActionButton(
            onPressed:(){

              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: "Decrement",
            child: Icon(Icons.remove), 
          ),
            FloatingActionButton(
            onPressed:(){

              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: "Reset",
            child: Icon(Icons.loop), 
          ),
        ],
      ),
    );
  }
}