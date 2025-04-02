import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
 class OwnMessage extends StatelessWidget {
  final String msg;
final String sender;
  const OwnMessage(  {super.key, required this.msg, required this.sender});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.maybeOf(context)!.size;

    return   ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.yellow[100],
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sender),
                        Text(msg)
                      
                      ],
                    ),
                  ),
                );
  
             
  
  
  }
}