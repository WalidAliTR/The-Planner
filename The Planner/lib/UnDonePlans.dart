import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Sidebar.dart';
import 'PlanDetails.dart';

Color bgstyle=Colors.green;
double prgpercent = 0.4;

class UnDonePlans extends StatefulWidget {
  const UnDonePlans({super.key});
  @override
  State<UnDonePlans> createState() => _UnDonePlansState();
}

class _UnDonePlansState extends State<UnDonePlans> {

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [for(int i=0;i<10;i++)plans(context)]; // List to store the containers
    return Scaffold(
        drawer: const Sidebar(),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(floating:true,shadowColor: Colors.black,scrolledUnderElevation: 8,centerTitle:true,title: Text("Uncompleted Plans",style: TextStyle(fontSize: 22),), backgroundColor: Colors.lightGreen,),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: containers
                )
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
              Text( '      First Plan',
                  style:TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.red)),
              SizedBox(height: 30,),
              Text( '   Deadline Was in 12 Dec 2022!',
                  style:TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.redAccent)),
            ],
          ),
          const SizedBox(width: 35),
          CircularPercentIndicator(
            animation: true,
            animationDuration: 450,
            progressColor: Colors.red,
            backgroundColor: Colors.red.shade50,
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