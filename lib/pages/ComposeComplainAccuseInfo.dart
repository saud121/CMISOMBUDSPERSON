
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Costants_english.dart';
import 'ComposeComplainFirstPage.dart';

class ComposeComplainAccuseInfo extends StatefulWidget {
  const ComposeComplainAccuseInfo({Key key}) : super(key: key);

  @override
  State<ComposeComplainAccuseInfo> createState() => _ComposeComplainAccuseInfoState();
}

class _ComposeComplainAccuseInfoState extends State<ComposeComplainAccuseInfo> {
  final AccuseNamecontroller = TextEditingController();
  final Accusedepartmentcontroller = TextEditingController();
  final Accusedesignationcontroller = TextEditingController();
  final AccuseCNICcontroller = TextEditingController();
  final AccusePhoneNumbercontroller = TextEditingController();
  final LocationOfHarrasmentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AccuseName  = TextField(
      obscureText: false,
      controller: AccuseNamecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.accuseName ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final AccusedepartmentName  = TextField(
      obscureText: false,
      controller: Accusedepartmentcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.accusedepartmentadress ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final Accusedesignation  = TextField(
      obscureText: false,
      controller: Accusedesignationcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.accusedesignation ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final AccuseCNIC  = TextField(
      obscureText: false,
      controller: AccuseCNICcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.accuseCNIC ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final AccusePhoneNumber  = TextField(
      obscureText: false,
      controller: AccusePhoneNumbercontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.accusePnumber ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final PlaceofHarrasment  = TextField(
      obscureText: false,
      controller: LocationOfHarrasmentcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.PlaceofHarrasment ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    return MaterialApp(
      home: Scaffold(
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
                Constants_english.ComposeNewComplain,
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
          child: Center(
            child: Container(
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Accuse Information",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontSize:25)),

                      SizedBox(height: 45.0),
                      AccuseName,
                      SizedBox(height: 25.0),
                      AccusedepartmentName,
                      SizedBox(height: 25.0),
                      AccuseCNIC,
                      SizedBox(height: 25.0),
                      Accusedesignation,
                      SizedBox(height: 25.0),
                      AccusePhoneNumber,
                      SizedBox(height: 25.0),
                      PlaceofHarrasment,
                      SizedBox(height: 30.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComplainFirstPage()));
                        },
                        icon:Icon(Icons.task_alt, color: Colors.white, size: 29,),
                        label: Text("Procced to next step 2/4"),
                        backgroundColor: Colors.green,
                        tooltip: 'Capture Picture',
                        elevation: 5,
                        splashColor: Colors.grey,
                      )
                    ]),
              ) ,
            ),
          ),
        ),
      ),
    );
  }
}
