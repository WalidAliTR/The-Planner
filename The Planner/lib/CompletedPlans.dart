import 'package:flutter/material.dart';
import 'Sidebar.dart';
import 'PlanDetails.dart';

Color bgstyle=Colors.green;

class CompletedPlans extends StatefulWidget {
  const CompletedPlans({super.key});
  @override
  State<CompletedPlans> createState() => _CompletedPlansState();
}

class _CompletedPlansState extends State<CompletedPlans> {

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [for(int i=0;i<10;i++)plans(context)]; // List to store the containers
    return Scaffold(
        drawer: const Sidebar(),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(floating:true,centerTitle:true,title: Text("Completed Plans",style: TextStyle(fontSize: 22),), backgroundColor: Colors.lightGreen,),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: containers)
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
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 25,),
              Text( 'First Plan',
                  style:TextStyle(fontSize: 27, fontWeight: FontWeight.w500,color: Color(0xffffffff))),
              SizedBox(height: 27,),
              Text( 'Finished on 30 Sep 2023',
                  style:TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: Color(0xffffffff))),
            ],
          ),
  ));
}