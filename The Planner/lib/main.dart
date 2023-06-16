import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Sidebar.dart';
import 'ActivePlan.dart';
import 'CompletedPlans.dart';
import 'UnDonePlans.dart';

void main() {
SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.lightGreen));
  runApp( MaterialApp(home: ActivePlan(),theme: ThemeData(primarySwatch: Colors.green)));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(centerTitle:true,title: const Text("The Planner",style: TextStyle(fontSize: 25),), backgroundColor: Colors.lightGreen),
        drawer: const Sidebar(),
        body: Center(child: ElevatedButton(onPressed: (){
        },child: const Text("Next Page"),),)
    );
  }
}