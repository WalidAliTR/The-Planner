import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanDetails extends StatefulWidget {
  const PlanDetails({super.key});
  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  String choosedDate= DateFormat('dd/MM/yyyy').format(DateTime.now());
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 10,
          onPressed: (){
            setState(() {
              
            });
          },
          backgroundColor: Colors.green,
          label: const Text("Save",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),)
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(floating:true,centerTitle:true,title: Text("Plan Details",style: TextStyle(fontSize: 22),), backgroundColor: Colors.lightGreen,),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15,),
                Container(
                        height: 265, width: MediaQuery.of(context).size.width-30,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Plan Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            TextField(
                              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                              controller: _textController,
                              decoration: const InputDecoration(
                                hintText: "Plan Title",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                /*suffixIcon: IconButton(
                                  onPressed: (){
                                    _textController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                )*/
                              ),
                            ),
                            const SizedBox(height: 40,),
                            const Text("Plan Deadline",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                            ),
                          const SizedBox(height: 5,),
                  GestureDetector(
                    onTap:(){
                      showDatePicker(context: context, initialDate: DateTime(2023), firstDate: DateTime(2023), lastDate: DateTime(2050)).then((value) => setState((){choosedDate=DateFormat('dd/MM/yyyy').format(value!);}));

                    },
                    child:Container(
                              height: 60,width: 240,alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(left: 38),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen[400],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                  children: [
                                     Text (choosedDate ,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                   const SizedBox(width: 30,),
                                   const Icon(Icons.calendar_month)
                                  ])

                          ))],
                        ),
                      ),
                      planStep(context),
                      planStep(context),planStep(context),
                      planStep(context),
                    ]
                )
              ]),
            )
          ],)
    );
  }
}

Widget planStep(BuildContext context){
  return Padding(padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: ((value) {}),
          ),
          const Text("A Plan Step"),
    ],
      ),
      ),
  );
}