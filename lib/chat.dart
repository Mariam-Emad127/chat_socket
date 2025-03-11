import 'package:chat_socket/models/messages_model.dart';
import 'package:chat_socket/wedgits/own_message.dart';
import 'package:chat_socket/wedgits/text_field_text.dart';
import 'package:chat_socket/wedgits/other_message.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat extends StatefulWidget {
  final String user;

  const Chat({super.key, required this.user});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();
  ScrollController _controller = ScrollController();
  IO.Socket? socket;
  List<MessagesModel> messages = [];
 
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    initSocket();
    /*
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          )
        });
  */
  }

  Future<void> initSocket() async {
    print('Connecting to chat service');

    socket = IO.io(
        "http://10.0.2.2:3000",
        //"http://localhost:3000",
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': true,
        });
    socket!.onConnectError((data) {
      print('Connection Error: $data');
    });

    socket!.onError((data) {
      print('Error: $data');
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('connected to websocket');
    });
    socket!.on('newChat', (message) {
      print(message);
      setState(() {
        // MessagesModel.
        messages.add(message);
      });
    });
    socket!.on(
      //  'messageServer',
      "receive_message",
        (msg) => {
              print("connected messageServer"),
              print(msg),
              setState(() {
                messages.add(MessagesModel(
                    type: msg["type"], msg: msg["msg"], sender: msg["sender"]));
              })
            });
  }

  void sendMessase({required String msg, required String senderName}) {
    MessagesModel ownMsg =
        MessagesModel(type: 'owMmsg', msg: msg, sender: senderName);
    messages.add(ownMsg);
    setState(() {
      messages;
    });
    socket!
        .emit("message", {"type": "owMmsg", "msg": msg, "sender": senderName,'sendbyMe':socket!.id});
    print("kkkkkkkkkknppp");
  }

  @override
  void dispose() {
    _messageController.dispose();
    socket!.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.60,
              child: Container(
                child: Text(
                  'Chat',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 60,
            width: size.width,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              cacheExtent: 1000,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
//                var message = MessagesModel.messages[MessagesModel.messages.length - index - 1];
                // messages[messages.length - index - 1];
                if (messages[index].type == "owMmsg") {
                  return OwnMessage(
                    msg: messages[index].msg,
                    sender: messages[index].sender,
                  );
                } else {
                  return OtherMessage(
                    msg: messages[index].msg,
                    sender: messages[index].sender,
                  );
                }
              },
            ),
          ),
          sendBubble(
              messageController: _messageController,
              onPressed: () {
                sendMessase(
                    msg: _messageController.text, senderName: widget.user);
                _messageController.clear();
              })
        ],
      ),
    );
  }
}
