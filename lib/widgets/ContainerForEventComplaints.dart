
import 'dart:ffi';

import 'package:cmis/Constants/Costants_english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerEvent extends StatelessWidget {
  final String ComplaintRemarks;
  // bool Isseen=false;
  // IconData Check;


  ContainerEvent({this.ComplaintRemarks});

  @override
  Widget build(BuildContext context) {
    // _checkIsseen(Isseen);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Center(

            //Create Colunm to add more icons for tree
            child:Padding(
                padding: const EdgeInsets.only(left: 2,right: 8),
                child: Icon(Icons.view_week,color:Colors.deepOrangeAccent,)),


          ),
        ),
        Flexible(
          child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text("Title",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,),),
                  ),
                ),
                Text(ComplaintRemarks,style:TextStyle(color:Colors.black87,fontSize:15),),
                SizedBox(height:5,),
                Text("Summary: And this is conclusion",style:TextStyle(color:Colors.black87,fontSize:15,fontWeight:FontWeight.bold),),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Padding(
                          padding: EdgeInsets.only(left:3,bottom:5),
                          child:Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("25-3-22 (Date)",style: TextStyle(fontSize: 15,color: Colors.white),),
                            ),
                          ) //Your widget here,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:3,bottom:5),
                          child:Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Notification Dispatched (Event type)",style: TextStyle(fontSize: 15,color: Colors.white),),
                            ),
                          ) //Your widget here,
                      ),
                    ]),
                Center(
                  child: SizedBox(
                    height: 2,
                    width: double.infinity,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Colors.red
                      ),
                    ),
                  ),
                )
              ]
          ),

        ),








      ],
    );

  }
  //
  // _checkIsseen(bool isseen) {
  //   if(Isseen=false){
  //
  //     return Check=Icons.check;
  //   }
  //   return Check=Icons.done_all;
  // }
}
