import 'package:cmis/Constants/Costants_english.dart';
import 'package:cmis/Constants/Globals.dart';
import 'package:cmis/widgets/ContainerForComplains.dart';
import 'package:cmis/widgets/ContainerForEventComplaints.dart';
import 'package:cmis/widgets/ContainerForTreeComplaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:convert';

class SingleComplain extends StatefulWidget {
  final int complainId;
  const SingleComplain({Key key,@required this.complainId}) : super(key: key);

  @override
  State<SingleComplain> createState() => _SingleComplainState();
}

class _SingleComplainState extends State<SingleComplain> {
  int selectedIndex = 0 ;
  Future<List<SingleComplaiInfo>> _getComplaindata() async {

    var data = await http.get(Uri.parse(Constant_api.ApiForComplains));

    var jsonData = json.decode(data.body);

    List<SingleComplaiInfo> Complaininfo = [];

    for(var u in jsonData){

      SingleComplaiInfo singleComplaiInfo = SingleComplaiInfo(u["id"],u["casetype"],u["casetimedate"],u["casedetail"],u["status"],u["casetilldate"], u["email"], u["first_name"], u["last_name"], u["avatar"]);
      // if(Globals.ComplainID == singleComplaiInfo.id) {
      //   print("hello masla hall");
        Complaininfo.add(singleComplaiInfo);
      // }
    }
    print(Complaininfo.length);

    return Complaininfo;

  }
  Future<List<Attachment>> _getAttachment() async {

    var data = await http.get(Uri.parse(Constant_api.ApiForComplains));

    var jsonData = json.decode(data.body);

    List<Attachment> attachments = [];

    for(var u in jsonData){

      Attachment attachment = Attachment(u["id"], u["avatar"]);

      attachments.add(attachment);

    }

    print(attachments.length);

    return attachments;

  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        
         home:Scaffold(
           appBar: new PreferredSize(
             child: new Container(
               padding: new EdgeInsets.only(
                   top: MediaQuery.of(context).padding.top
               ),
               child: new Padding(
                 padding: const EdgeInsets.only(
                     top: 20.0,
                     bottom: 20.0
                 ),
                 child: new Text(
                   Constants_english.Total+" Complains",
                   textAlign: TextAlign.center,
                   style: new TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.w500,
                       color: Colors.white
                   ),
                 ),
               ),
               decoration: new BoxDecoration(
                   gradient: new LinearGradient(
                       colors: [
                         Colors.blue,
                         Colors.white70
                       ]
                   ),
                   boxShadow: [
                     new BoxShadow(
                       color: Colors.grey[500],
                       blurRadius: 20.0,
                       spreadRadius: 1.0,
                     )
                   ]
               ),
             ),
             preferredSize: new Size(
                 MediaQuery.of(context).size.width,
                 150.0
             ),
           ),
           body: SingleChildScrollView(
             child: Column(
               children: [
                 Center(
                   child: Container(
                     padding: EdgeInsets.all(2.0),
                     color: Colors.grey[300],
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         RaisedButton(
                           child: Row(
                             children: [
                               Icon(Icons.add_road),
                               SizedBox(width:5,),
                               Text('Complain Timeline'),
                             ],
                           ),
                           textColor: Colors.white,
                           color: selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
                           onPressed: (){
                             setState(() {
                               selectedIndex = 0 ;
                             });
                           },
                         ),
                         RaisedButton(
                           child: Row(
                             children: [
                               Icon(Icons.account_tree),
                               SizedBox(width:5,),

                               Text('Complain Events'),
                             ],
                           ),
                           textColor: Colors.white,
                           color: selectedIndex == 1 ? Colors.pinkAccent : Colors.grey,
                           onPressed: (){
                             setState(() {
                               selectedIndex = 1 ;
                             });
                           },
                         ),

                       ],
                     ),
                   ),
                 ),
                if(selectedIndex==0)
                 Padding(
                   padding: const EdgeInsets.only(top:10,bottom: 5),
                   child: Center(
                     child: Text("Complain Timeline",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                   ),
                 )
                  else
                    Padding(
                  padding: const EdgeInsets.only(top:10,bottom: 5),
                  child: Center(
                  child: Text("Complain Events",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                  ),
                  ),
                 if(selectedIndex==0)
                 Stack(
                 children: <Widget>[
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,boxShadow: [
                            BoxShadow(
                              color: Colors.black26.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),

                          ],
                          border: Border.all(color:Colors.grey) ),
                      width: double.infinity,
                      height:300,
                      child: FutureBuilder(
                     future: _getComplaindata(),
                 builder: (BuildContext context, AsyncSnapshot snapshot){

                   print(snapshot.data);
                   if(snapshot.data == null){
                     return Container(
                         child: Center(
                             child: Text("Loading...")
                         )
                     );
                   } else {
                     return ListView.builder(
                       itemCount: snapshot.data.length,
                       itemBuilder: (BuildContext context, int index) {
                         var c;
                         if(snapshot.data[index].status.toString()=="NEW"){
                           c=Colors.green;
                         };
                         if(snapshot.data[index].status.toString()=="PENDING"){
                           c=Colors.blue;
                         };
                         if(snapshot.data[index].status.toString()=="END"){
                           c=Colors.red;
                         };
                         return Container(
                           margin: EdgeInsets.only(top:10),
                           child: LimitedBox(
                             maxHeight: 250,
                             child: Container(

                               child:
                               ContainerTree(ComplaintRemarks:"New Complaint and it is very long long long long long long long long long long long long long sentence",Isseen:true,)
                             ),
                           ),
                         );
                         //   ListTile(
                         //   leading: CircleAvatar(
                         //     backgroundImage: NetworkImage(
                         //         snapshot.data[index].picture
                         //     ),
                         //   ),
                         //   title: Text(snapshot.data[index].name),
                         //   subtitle: Text(snapshot.data[index].email),
                         //   onTap: (){
                         //
                         //     Navigator.push(context,
                         //         new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                         //     );
                         //
                         //   },
                         // );
                       },
                     );
                   }
                 },
         ) ,

                    ),



                        ]
                   )
                  else
                   Stack(
                       children: <Widget>[
                         Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                               color: Colors.white,boxShadow: [
                                 BoxShadow(
                                   color: Colors.black26.withOpacity(0.1),
                                   spreadRadius: 1,
                                   blurRadius: 2,
                                   offset: Offset(0, 3), // changes position of shadow
                                 ),

                               ],
                               border: Border.all(color:Colors.grey) ),
                           width: double.infinity,
                           height:300,
                           child: FutureBuilder(
                             future: _getComplaindata(),
                             builder: (BuildContext context, AsyncSnapshot snapshot){

                               print(snapshot.data);
                               if(snapshot.data == null){
                                 return Container(
                                     child: Center(
                                         child: Text("Loading...")
                                     )
                                 );
                               } else {
                                 return ListView.builder(
                                   itemCount: snapshot.data.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     var c;
                                     if(snapshot.data[index].status.toString()=="NEW"){
                                       c=Colors.green;
                                     };
                                     if(snapshot.data[index].status.toString()=="PENDING"){
                                       c=Colors.blue;
                                     };
                                     if(snapshot.data[index].status.toString()=="END"){
                                       c=Colors.red;
                                     };
                                     return Container(
                                       margin: EdgeInsets.only(top:10),
                                       child: LimitedBox(
                                         maxHeight: 250,
                                         child: Container(

                                             child:
                                             ContainerEvent(ComplaintRemarks:"New Complaint Event is intiaiated and the following is very long long long long long long long long long long long long long sentence")
                                         ),
                                       ),
                                     );
                                     //   ListTile(
                                     //   leading: CircleAvatar(
                                     //     backgroundImage: NetworkImage(
                                     //         snapshot.data[index].picture
                                     //     ),
                                     //   ),
                                     //   title: Text(snapshot.data[index].name),
                                     //   subtitle: Text(snapshot.data[index].email),
                                     //   onTap: (){
                                     //
                                     //     Navigator.push(context,
                                     //         new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                                     //     );
                                     //
                                     //   },
                                     // );
                                   },
                                 );
                               }
                             },
                           ) ,

                         ),



                       ]
                   ),
                 Padding(
              padding: const EdgeInsets.only(top:10,bottom: 5),
              child: Center(
                child: Text(Constants_english.Complaintbody,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
              ),
          ),
                 Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.white,border: Border.all(color:Colors.grey) ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(Globals.CopmainBody,style: TextStyle(fontSize:15,color: Colors.black),),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top:10,bottom: 5),
                   child: Center(
                     child: Text(Constants_english.Complaintattachment,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                   ),
                 ),
                 Container(
               margin: EdgeInsets.symmetric(vertical: 20.0),
               height: 400,
               child: new FutureBuilder(
                 future: _getAttachment(),
                 builder: (BuildContext context, AsyncSnapshot snapshot){

                   print(snapshot.data);
                   if(snapshot.data == null){
                     return Container(
                         child: Center(
                             child: Text("Loading...")
                         )
                     );
                   } else {
                     return ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.white,border: Border.all(color:Colors.grey) ),
                           margin: EdgeInsets.only(top:8,left: 5),
                           child: Image.network(
                                 snapshot.data[index].picture,
                                 fit: BoxFit.fill,
                                 loadingBuilder: (BuildContext context, Widget child,
                                     ImageChunkEvent loadingProgress) {
                                   if (loadingProgress == null) return child;
                                   return Center(
                                     child: CircularProgressIndicator(
                                       value: loadingProgress.expectedTotalBytes != null
                                           ? loadingProgress.cumulativeBytesLoaded /
                                           loadingProgress.expectedTotalBytes
                                           : null,
                                     ),
                                   );
                                 },
                               ),


                         );
                       },
                     );
                   }
                 },
               )
           ),
                 Container(

                   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.white,border: Border.all(color:Colors.black) ),
                   child: Align(
                     alignment: Alignment.topLeft,
                     child: Icon(
                       Icons.play_circle_filled_outlined,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top:10,bottom: 5),
                   child: Center(
                     child: Text(Constants_english.Complaintstatus,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                   ),
                 ),
                 Padding(
                     padding: EdgeInsets.only(left:3,bottom:5),
                     child:Container(
                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.red),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(Globals.ComplainStatus,style: TextStyle(fontSize: 20,color: Colors.white),),
                       ),
                     ) //Your widget here,
                 ),
               ],
             ),
           ),
         )

      );
  }
}
class SingleComplaiInfo {
  int id;
  final String casetype;
  final String casetimedate;
  final String casedetail;
  final String status;
  final String casetilldate;
  final String name;
  final String lastname;
  final String email;
  final String picture;

  SingleComplaiInfo(this.id,this.casetype,this.casetimedate,this.casedetail,this.status,this.casetilldate, this.email,this.lastname, this.name, this.picture,);

}
class Attachment {
  final int id;
  final String picture;

  Attachment(this.id, this.picture,);

}