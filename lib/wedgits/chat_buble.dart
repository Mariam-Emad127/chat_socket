import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Container(
   
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        color: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  
  }
}

class ReChatbubble extends StatelessWidget {
  const ReChatbubble({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Container(
   
        alignment: Alignment.topLeft ,
        margin: EdgeInsets.only(top: 20),
        color: Colors.grey,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
  
  }
}
 