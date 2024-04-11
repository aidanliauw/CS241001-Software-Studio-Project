import 'dart:html';
import 'dart:ui';

import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:softwarestudio/translation_page.dart';
import 'package:softwarestudio/message.dart';
import 'dart:async';

class TranslationPage extends StatefulWidget {
  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  final List<Message> messages = [];
  final List<String> chinese =[
    '視差滾動是一種電腦圖形技術，其中背景圖像比前景圖像更慢地移動過相機。',
    '這個技術能製造出在二維場景中距離和深度的幻覺。',
    '我們在這個demo裡面使用flutter 的 flow widget來移動 card內的照片。',
    '照片會根據card在螢幕上的位置移動，使得照片與card製造視差滾動的效果。',
    
  ];
  final List<String> english =[
    'Parallax scrolling is a technique in computer graphics where background images move past the camera more slowly than foreground images.',
    'It creats an illusion of depth in a 2D scene of distance.',
    'In this demo, we use Flutter\'s Flow widget to move the images inside card widgets.',
    'The images move based on the position of cards on the screen, creating a parallax scrolling effect between the images and the cards.',
  ];
  bool messageIsGenerating=false;
  String response='';
  void _sendMessage(String text) {
  Future.delayed(Duration(seconds: 0), () {
    if (text.isNotEmpty) {
      int i = 0;
      int j=0;
      Timer.periodic(Duration(seconds: 4), (timer) {
        if(this.mounted){
          setState(() {
          messages.add(Message(text: chinese[i], isMe: true));
          listViewScrollController.animateTo(
            listViewScrollController.position.maxScrollExtent+300,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeInOut,
          );
          j=i;
          Future.delayed(Duration(milliseconds: 1500), () {
            if (i < chinese.length) {
              setState(() {
                messages.add(Message(text: english[j], isMe: false));
                listViewScrollController.animateTo(
                  listViewScrollController.position.maxScrollExtent+300,
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  curve: Curves.easeInOut,
                );
              });
              if(j==3){
                setState(() {
                  buttonIconColor=Theme.of(context).colorScheme.onPrimary;
                  buttonColor=Theme.of(context).colorScheme.primary;
                  buttonIcon=Icons.pause;
                  isplay=false;
                  messageIsGenerating=false;
                });
              }
            }
          });
        });
        }
        


        if (i < chinese.length - 1) {
          i++;
        } else {
          timer.cancel(); // Stop the timer when all Chinese messages are sent
        }
      });
    }
  });
}
ScrollController listViewScrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessage(message);
              },
              controller: listViewScrollController,
            ),
          ),
          _buildMainButton()
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.isMe ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
bool isplay=false;
IconData buttonIcon = Icons.mic;
Color buttonColor = Colors.black;
Color buttonIconColor = Colors.black;
Widget _buildMainButton() {


  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Send Button
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor==Colors.black?Theme.of(context).colorScheme.primary:buttonColor,
            ),
            child: IconButton(
              color: buttonIconColor==Colors.black?Theme.of(context).colorScheme.onPrimary:buttonIconColor,
              iconSize: 30,
              icon: Icon(buttonIcon),
              onPressed: () {
                if(messageIsGenerating){

                }
                else{
                  setState(() {
                  isplay=!isplay;
                  if(isplay){
                    buttonIcon = Icons.square;
                    buttonColor=Theme.of(context).colorScheme.onSecondary;
                    buttonIconColor=Theme.of(context).colorScheme.secondary;
                  }
                  else{
                    buttonIcon = Icons.mic;
                    buttonColor= Theme.of(context).colorScheme.onPrimary;
                    buttonIconColor=Theme.of(context).colorScheme.primary;
                  }
                  _sendMessage('test');
                  messageIsGenerating=true;
                  });
                }
              },
            ),
          ),
        ),
      ],
    ),
  );
}
}