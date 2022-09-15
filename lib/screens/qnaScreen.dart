import 'package:flutter/material.dart';
import 'package:health_app/Model/questionAnswer.dart';
import 'package:health_app/Widget/DrawerWidget.dart';
import 'package:health_app/Widget/flutter_tag_view.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';

class QNAScreen extends StatefulWidget {
  @override
  _QNAScreenState createState() => _QNAScreenState();
}

class _QNAScreenState extends State<QNAScreen> {

  int questionNo = 1;
  List containerList = [];
  List<QuestionAnswer> questionAnswerList = [];

  List<QuestionAnswer> questionAnswerListRun = [
    QuestionAnswer(
      id: 1,
      isVisible: true,
      isAnswer: true,
      isSender: false,
      message:
      'Please note that information from this chat will be used for monitoring & management of '
          'the current health crisis and research in the fight against COVID-19',
      answer: [],
    ),
    QuestionAnswer(
      id: 2,
      isVisible: true,
      isAnswer: false,
      isSender: false,
      message: 'Are you experiencing any of the following symptoms?',
      answer: [],
    ),
    QuestionAnswer(
      id: 3,
      isVisible: true,
      isAnswer: false,
      isSender: true,
      message: null,
      answer: ['Diabetes',
        'Hypertension',
        'Lung disease',
        'Heart Disease',
        'Kidney Disorder','None of the Above'],
    ),
    QuestionAnswer(
      id: 4,
      isVisible: false,
      isAnswer: false,
      isSender: false,
      message: 'Have you ever had of the following:',
      answer: [],
    ),
    QuestionAnswer(
      id: 5,
      isVisible: false,
      isAnswer: false,
      isSender: true,
      message: null,
      answer: [
        'Diabetes',
        'Hypertension',
        'Lung disease',
        'Heart Disease',
        'Kidney Disorder',
        'None of the Above'
      ],
    ),
    QuestionAnswer(
      id: 6,
      isVisible: false,
      isAnswer: false,
      isSender: false,
      message:
      'Have you traveled anywhere internationally in the last 28-45 days?',
      answer: [],
    ),
    QuestionAnswer(
      id: 7,
      isVisible: false,
      isAnswer: false,
      isSender: true,
      message: null,
      answer: ['Yes', 'No'],
    ),
    QuestionAnswer(
      id: 8,
      isVisible: false,
      isAnswer: false,
      isSender: false,
      message: 'Which of the following apply to you?',
      answer: [],
    ),
    QuestionAnswer(
      id: 9,
      isVisible: false,
      isAnswer: false,
      isSender: true,
      message: null,
      answer: [
        'I have recently interacted or lived with someone who has tested positive for COVID-19',
        'I am a healthcare worker and i examined a COVID-19 confirmed case without protective gear',
        'None of the Above',
      ],
    ),
    QuestionAnswer(
      id: 10,
      isVisible: false,
      isAnswer: false,
      isSender: false,
      message:
      'Your infection risk is low. We recommend that you stay at home to avoid any '
          'chance of exposure to the Novel Coronavirus.\n\nRetake the Self-Assessment Test if you '
          'develop symptoms or come in contct with a COVID-19 confirmed patient\n\nDo visit http://cdcmoh.gov.kh/ for '
          'more information',
      answer: [],
    ),
    QuestionAnswer(
      id: 11,
      isVisible: false,
      isAnswer: false,
      isSender: true,
      message: null,
      answer: [
        'Ok',
      ],
    ),
  ];

  @override
  void initState() {
    var aquestionAnswerList = questionAnswerListRun;
    questionAnswerList = aquestionAnswerList;
    setMsgArray();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: AppColors.primaryColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.icn_smallLogo),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
              },
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showToastMsg(msg: "Coming Soon!!");
              },
              child: Image(
                image: AssetImage(AppIcons.icn_language),
                width: 28,
                height: 28,
              ),
            ),
          ),
          SizedBox(width: 8,)
        ],
      ),
      //drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0; i< containerList.length; i++)
                containerList[i]
            ],
          ),
        ),
      ),
    );
  }

  receiverCell({msg}){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 60, bottom: 10),
        //alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Text(msg, style: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),),
      ),
    );
  }

  senderCell({msg}){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Text(msg, style: TextStyle(
            color: Colors.black87,
            fontSize: 14
        ),),
      ),
    );
  }

  setMsgArray(){
    containerList.clear();
    questionAnswerList = questionAnswerListRun;
    for(int i=0; i<questionAnswerList.length; i++){
      if(!(questionAnswerList[i].message != null)) {
          containerList.add(FlutterTagView(
            tags: questionAnswerList[i].answer,
            maxTagViewHeight: 150,
            deletableTag: false,
            onValueTap: (msg){
              questionAnswerList[i].message = msg;
              setMsgArray();
              setState(() {
              });
            },
            //onDeleteTag: tagDeleted,
            //tagTitle: tagTitle,
          ),);
        break;
      } else {
        if(questionAnswerList[i].isSender) {
          containerList.add(senderCell(msg: questionAnswerList[i].message));
        }
      }
      if(!questionAnswerList[i].isSender)
        containerList.add(receiverCell(msg: questionAnswerList[i].message));
    }
  }
}