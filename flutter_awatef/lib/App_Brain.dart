import "package:flutter_awatef/question.dart";


class AppBrain{
  int _questionNumb = 0;
  List<Question> _questionGroup =
  [Question('Le nombre de planètes dans le système solaire est de huit.', 'assets/image-1.jpg', true),
    Question('les chats sont des carnivores', 'assets/image-2.jpg', true),
    Question('La Chine est située sur le continent africain', 'assets/image-3.jpg', false),
    Question('La Terre est plate, pas sphérique', 'assets/image-4.jpg', false)
  ];
  void nextQuestion(){
    if(_questionNumb < _questionGroup.length - 1){
      _questionNumb++;
    }
  }
  String getQuestionText(){
    return _questionGroup[_questionNumb].questionText;
  }
  String getQuestionImage(){
    return _questionGroup[_questionNumb].questionImage;
  }
  bool getQuestionAnswer(){
    return _questionGroup[_questionNumb].questionAnswer;
  }
  bool isFinished(){
    if(_questionNumb >= _questionGroup.length - 1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _questionNumb=0;
  }
}