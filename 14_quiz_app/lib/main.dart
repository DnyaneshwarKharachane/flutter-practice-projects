import "package:flutter/material.dart";
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
    const QuizApp({super.key});
    @override
    State createState()=>_QuizAppState();
    
}
class _QuizAppState extends State{
  List<Map>allQuestions=[
    {'question':"Who is the founder of Apple?",
     'options':['Steve Jobs','Elon Musk','Bill Gates','Lary Page'],
     'correctAnswer':0,
    },
    {'question':"Who is the founder of Microsoft?",
     'options':['Steve Jobs','Elon Musk','Bill Gates','Lary Page'],
     'correctAnswer':2,
    },
    {'question':"Who is the founder of Google?",
     'options':['Steve Jobs','Elon Musk','Bill Gates','Lary Page'],
     'correctAnswer':3,
    },
    {'question':"Who is the founder of OpenAI?",
     'options':['Steve Jobs','Elon Musk','Bill Gates','Lary Page'],
     'correctAnswer':0,
    },
    {'question':"Who is the founder of SpaceX",
     'options':['Steve Jobs','Elon Musk','Bill Gates','Lary Page'],
     'correctAnswer':1,
    },
  ];
  int currentQuestionIndex=0;
  int selected=-1;
  bool isQuestionpage=true;
  int score=0;
  WidgetStatePropertyAll<Color?>checkAnswer(int ansIndex){
    if(selected != -1){
      if(ansIndex==allQuestions[currentQuestionIndex]['correctAnswer']){
        if(selected==allQuestions[currentQuestionIndex]['correctAnswer']){
          score++;
        }
        return WidgetStatePropertyAll(Colors.green);
      }else if(selected==ansIndex){
        return WidgetStatePropertyAll(Colors.red);
      }
      else{
        return WidgetStatePropertyAll(null);
      }
    }else{
      return WidgetStatePropertyAll(null);
    }
  }
    @override
    Widget build(BuildContext context){
      return quizAppPage();
    }
    Scaffold quizAppPage(){
      if(isQuestionpage==true){
        return Scaffold(
          appBar:AppBar(
            title:const Text("QuizApp",
              style:TextStyle(fontSize:30,
              fontWeight:FontWeight.w700,
              ),
            ),
            backgroundColor:Colors.blue,
            centerTitle:true,
          ),
          body:Column(children: [
            const SizedBox(height:10),
            Row(children: [
              const SizedBox(width:440),
              Text(
                "Question:${currentQuestionIndex+1}/${allQuestions.length}",
                style:TextStyle(fontSize:30,fontWeight:FontWeight.w600)
              ),
            ],),
            const SizedBox(height:20),
            SizedBox(
               height:50,
               width:380,
               child:Text(
                allQuestions[currentQuestionIndex]['question'],
                style:TextStyle(fontSize:25,fontWeight:FontWeight.w600,),
               ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height:50,
              width:300,
              child:ElevatedButton(
                style:ButtonStyle(backgroundColor:checkAnswer(0)),
                onPressed:(){
                   if(selected == -1){
                    selected=0;
                    setState((){});
                   }
                },
                child:Text(
                  allQuestions[currentQuestionIndex]['options'][0],
                  style:TextStyle(fontSize:20,fontWeight:FontWeight.w500),
                ),
              ),
            ),   
            const SizedBox(height: 20),
            SizedBox(
              height:50,
              width:300,
              child:ElevatedButton(
                style:ButtonStyle(backgroundColor:checkAnswer(1)),
                onPressed:(){
                   if(selected==-1){
                    selected=1;
                    setState((){});
                   }
                },
                child:Text(
                  allQuestions[currentQuestionIndex]['options'][1],
                  style:TextStyle(fontSize:20,fontWeight:FontWeight.w500),
                ),
              ),
            ),  
            const SizedBox(height: 20,),
            SizedBox(
              height:50,
              width:300,
              child:ElevatedButton(
                style:ButtonStyle(backgroundColor:checkAnswer(2)),
                onPressed:(){
                   if(selected==-1){
                    selected=2;
                    setState(() {});
                   }
                },
                child:Text(
                  allQuestions[currentQuestionIndex]['options'][2],
                  style:TextStyle(fontSize:20,fontWeight:FontWeight.w500),
                ),
              ),
            ),  
            const SizedBox(height: 20,),
            SizedBox(
              height:50,
              width:300,
              child:ElevatedButton(
                style:ButtonStyle(backgroundColor:checkAnswer(3)),
                onPressed:(){
                   if(selected==-1){
                    selected=3;
                    setState((){});
                   }
                },
                child:Text(
                  allQuestions[currentQuestionIndex]['options'][3],
                  style:TextStyle(fontSize:20,fontWeight:FontWeight.w500),
                ),
              ),
            ),
            ],),
            floatingActionButton:FloatingActionButton(
              onPressed: (){
                if(selected!=-1){
                  if(currentQuestionIndex<allQuestions.length-1){
                    currentQuestionIndex++;
                    selected=-1;
                    }else{
                      isQuestionpage=false;
                    }
                    setState((){});
                  }
                },
              
              backgroundColor: Colors.blue,
              child:const Text("Next",
              style:TextStyle(fontSize: 15),
              ),
            ),
          );
        }else{
          return Scaffold(
           appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle:true,
            title:Text("Result Screen",style:TextStyle(fontSize:30)),
           ),
           body:Center(
            child:Column(
              children:[
                Image.network("data:image/jpeg;base64,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",
                width:500,
                height:500),
                SizedBox(height:30),
                Text("Congratulations",style:TextStyle(fontSize:25,fontWeight: FontWeight.w600)),
                SizedBox(height: 30,),
                Text("Score:$score/${allQuestions.length}",style:TextStyle(fontSize:20)),
              ],
            ),
           ),
          );
        }
    }
    }