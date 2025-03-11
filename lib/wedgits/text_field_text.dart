import 'package:flutter/material.dart';

class sendBubble extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback onPressed;
  const sendBubble({super.key, required this.messageController, required this.onPressed});

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.maybeOf(context)!.size;
    return       Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.80,
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      controller: messageController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Message",
                        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: '',
                      ),
                      style: TextStyle(fontSize: 15),
                      keyboardType: TextInputType.text,
                      maxLength: 500,
                    ),
                  ),
                  Container(
                    width: size.width * 0.20,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.redAccent),
                      onPressed: 
                      //() {
                      onPressed
                      //  _sendMessage();
                      //},
                    ),
                  )
                ],
              ),
            ),
          );
       
  }
}