import 'package:flutter/material.dart';
import 'package:themes/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionindex = 0;

  List questionBank =[
    Question.name("the counter is going down", true),
    Question.name("hope this is working", false),
    Question.name("this not goint to work this time", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset("images/flag.png",width: 180,)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,style: BorderStyle.solid
                    )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: Text(questionBank[_currentQuestionindex].questionText,//style: TextStyle(
                    //   fontSize: 16.9,
                    //   color: Colors.white
                    // ),
                     ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: ()=>_prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back,color: Colors.white,),),

                  RaisedButton(onPressed: ()=>_checkAnswer(true, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("TRUE",style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: ()=>_checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text("FALSE",style: TextStyle(color: Colors.white),),),

                  RaisedButton(onPressed: ()=>_nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward,color: Colors.white,),)
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionindex].isCorrect){
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 100),
          content: Text("Correct"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("yes correct");
    }else{
      debugPrint("not correct");
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
          duration: Duration(milliseconds: 100),
          content: Text("Incorrect"));
      Scaffold.of(context).showSnackBar(snackbar);
    _updateQuestion();
    }
  }

  _nextQuestion() {
    _updateQuestion();
  }
  _updateQuestion(){
    setState(() {
      _currentQuestionindex = (_currentQuestionindex + 1) % questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionindex = (_currentQuestionindex - 1) % questionBank.length;
      debugPrint("index:$_currentQuestionindex");
    });
  }
}
