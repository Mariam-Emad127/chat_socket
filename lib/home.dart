import 'package:chat_socket/chat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Center(
       child: TextButton(onPressed: (){
          showDialog(context: context, builder:(context){return AlertDialog(
title: Text("enter name"),
content: TextFormField(
  controller: nameController,
),
actions: [
TextButton(onPressed: (){
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder:  (context){return Chat(user: nameController.text,);}));
},child: Text("Enter"),)

],

          );}  );} ,
           child: Text( "enter chat")),
     ),
    );
  }
}