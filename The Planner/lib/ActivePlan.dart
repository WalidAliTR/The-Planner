import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Sidebar.dart';
import 'PlanDetails.dart';

Color bgstyle=Colors.green;
double prgpercent = 0.0;

class ActivePlan extends StatefulWidget {
  const ActivePlan({super.key});

  @override
  State<ActivePlan> createState() => _ActivePlanState();
}

class _ActivePlanState extends State<ActivePlan> {
  final List<Widget> _containers = []; // List to store the containers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Sidebar(),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: (){
            setState(() {
              _containers.add(plans(context));
            });
          },
          backgroundColor: Colors.green.shade700,
          child: const Icon(Icons.add_sharp,size: 33),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(floating:true,centerTitle:true,title: Text("Active Plans",style: TextStyle(fontSize: 25),), backgroundColor: Colors.lightGreen,),
            SliverList(
              delegate: SliverChildListDelegate([
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _containers)
              ]),
            )
            ],
    )
    );
  }
}

Widget plans(BuildContext context){

  if(bgstyle==Colors.green) {
    bgstyle=const Color(0xFF8BC34A);
  } else {
    bgstyle=Colors.green;
  }

  return GestureDetector(
    onTap:(){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const PlanDetails()));
    },
    child: Container(
      height: 120, width: MediaQuery.of(context).size.width,
      color: bgstyle,
        child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 25,),
              Text( '        New Plan',
                  style:TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Color(0xffffffff))),
              SizedBox(height: 30,),
              Text( '   From 1 Feb 2023 To 31 Dec 2023',
                  style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Color(0xffffffff))),
            ],
          ),
          const SizedBox(width: 55),
          CircularPercentIndicator(
            animation: true,
              animationDuration: 450,
              progressColor: Colors.teal,
              backgroundColor: Colors.teal.shade50,
              radius: 45,
              lineWidth: 12,
              percent: prgpercent,
              circularStrokeCap: CircularStrokeCap.round,
            center: Text("${prgpercent*100}%",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ),
        ],
      )

  ));
}