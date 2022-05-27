
import 'package:cmis/Constants/Globals.dart';
import 'package:cmis/pages/ComposeComplainpPersonalInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Costants_english.dart';
import '../soundRecorderPlayer/sound_player.dart';
import 'AudioRecord_page.dart';
import 'ComposeNewComplain_page.dart';

class ComplainFirstPage extends StatefulWidget {
  const ComplainFirstPage({Key key}) : super(key: key);

  @override
  State<ComplainFirstPage> createState() => _ComplainFirstPageState();
}

class _ComplainFirstPageState extends State<ComplainFirstPage> {
  final player = SoundPlayer();
  @override
  void initState(){
    super.initState();
    player.init();

  }
  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("pathtouri11 ${Globals.PathToAudioUri}");
    bool isPlaying;
    if(player.isPlaying!= null){
      isPlaying= player.isPlaying;
    }
    else{
      isPlaying = false;
    }
    final PlaybuttonIcon= isPlaying ? Icons.stop : Icons.play_circle_filled;
    final PlaybuttonText= isPlaying ? "Stop Recorded Complain" : "Play Recorded Complain";
    final Playprimary= isPlaying ? Colors.red : Colors.white;
    final PlayonPrimar= isPlaying ? Colors.white : Colors.black;
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
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(Constants_english.Reliventinfo,style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(Constants_english.AttachAudio,style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: Padding(
                  padding: const EdgeInsets.only(top:10,bottom: 5),
                  child: Center(
                    child: Text(Constants_english.Complaintbody,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.black)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Write your Complain here.',
                    suffixIcon: Icon(Icons.edit_note_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              Text("If you can not type complain please record audio complain"),
              Container(
                child: Material(
                  child: InkWell(
                      splashColor: Colors.blue,
                      onTap: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => recordPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                          child: Column(
                            children: [

                              Icon(Icons.mic_outlined,size: 50,),

                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text("Audio"),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              if(Globals.PathToAudioUri!=null)
              Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175,50),
                    primary: Playprimary,
                    onPrimary: PlayonPrimar,
                  ),
                  icon: Icon(PlaybuttonIcon),
                  label: Text(PlaybuttonText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onPressed: () async{
                    await player.togglePlaying(whenFinished: () => setState((){}) );
                    setState(() {});
                  },
                ),
              )
                else
                  SizedBox(height: 2),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewComplain()));
                },
                icon:Icon(Icons.task_alt, color: Colors.white, size: 29,),
                label: Text("Procced to next step 3/4"),
                backgroundColor: Colors.green,
                tooltip: 'Capture Picture',
                elevation: 5,
                splashColor: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
