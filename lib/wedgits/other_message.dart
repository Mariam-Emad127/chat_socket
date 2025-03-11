import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
class OtherMessage extends StatelessWidget {
    final String msg;
final String sender;
  const OtherMessage({super.key, required this.msg, required this.sender});

  @override
  Widget build(BuildContext context) {
            Size size = MediaQuery.maybeOf(context)!.size;

    return         ChatBubble(
                        clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        backGroundColor: Colors.grey[100],
                        child: Container(
                          constraints: BoxConstraints(maxWidth: size.width * 0.7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( sender),
                              Text( msg)
                             
                           //   Text('${message['sender']} @${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                             // Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))
                            ],
                          ),
                        ),
                      );
              
  }
}