import 'package:flutter/material.dart';
import 'package:flutter_awatef/App_Brain.dart';
import 'package:flutter_awatef/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
AppBrain appBrain=AppBrain();

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey,
        title: const Text("Exam"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: ExamPage(),
      ),
      ),
    );
  }
}
class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List <Widget> answerResult = [];
  int correctanswer=0;
  void checkAnswer(bool whatUserPick){
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
    if(correctAnswer==whatUserPick){
      correctanswer++;
      print('good');
      answerResult.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.thumb_up, color: Colors.green,),
        ),
      );
    }else{
      print('oupus!');
      answerResult.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.thumb_down, color: Colors.red,),
        ),
      );

    }
    if(appBrain.isFinished()){
      Alert(
        context: context,
        type: AlertType.error,
        title: "Tu as terminé l'examen",
        desc: "$correctanswer / 4",

        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      appBrain.reset();
      answerResult = [];
      correctanswer=0;

    }else{
      appBrain.nextQuestion();
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
       Row(
          children: answerResult,
       ),
       Expanded(
         flex : 5,
         child: Column(
         children: [
           Image.asset(appBrain.getQuestionImage()),
           SizedBox(height: 20.0,),
           Text(
             appBrain.getQuestionText(),
             style: TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 24.0,
             ),
             ),
         ],
       ),
       
       ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextButton(
             onPressed: (){

               print(appBrain.getQuestionText());
               checkAnswer(true);
             },
             style: TextButton.styleFrom(
               foregroundColor: Colors.white,
               backgroundColor: Colors.green,
             ),
             child: const Text(
               'Oui',
               style: TextStyle(fontSize: 24),
             ),
       ),
         ),),
       Expanded(

         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextButton(
             onPressed: (){
               checkAnswer(false);
             },
             style: TextButton.styleFrom(
               foregroundColor: Colors.white,
               backgroundColor: Colors.red,
             ),
             child: const Text(
               'Non ',
               style: TextStyle(fontSize: 24),
             ),
           ),
         ),)
     ],

    );
  }
}

